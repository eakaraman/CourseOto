-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 May 2020, 17:05:18
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
-- Veritabanı: `coursedatabase`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `class`
--

INSERT INTO `class` (`id`, `name`, `start_date`, `end_date`, `teacher_id`, `course_id`) VALUES
(1, 'Level 1', '2021-01-15', '2021-07-15', 1, 1),
(2, 'Level 2', '2021-01-15', '2021-07-15', 2, 2),
(3, 'Level 3', '2021-01-15', '2021-07-15', 3, 3),
(4, 'Level 4', '2021-01-15', '2021-07-15', 4, 4),
(5, 'Level 5', '2021-01-15', '2021-07-15', 5, 5),
(6, 'Level 6', '2021-01-15', '2021-07-15', 6, 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `class_student`
--

CREATE TABLE `class_student` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `class_student`
--

INSERT INTO `class_student` (`id`, `class_id`, `student_id`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `lessons` int(11) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `term` varchar(100) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `course`
--

INSERT INTO `course` (`id`, `lessons`, `description`, `term`, `level_id`) VALUES
(1, NULL, NULL, NULL, 1),
(2, NULL, NULL, NULL, 2),
(3, NULL, NULL, NULL, 3),
(4, NULL, NULL, NULL, 4),
(5, NULL, NULL, NULL, 5),
(6, NULL, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `class_student_id` int(11) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `result` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tetikleyiciler `exam`
--
DELIMITER $$
CREATE TRIGGER `examtrigger` AFTER INSERT ON `exam` FOR EACH ROW BEGIN
DECLARE temp INT;
DELETE FROM class_student WHERE student_id = NEW.class_student_id;
IF NEW.result > 0 AND NEW.result <26 THEN SET temp := 1;
ELSEIF NEW.result>25 AND NEW.result <46 THEN SET temp := 2;
ELSEIF NEW.result > 45 AND NEW.result <66 THEN SET temp := 3;
ELSEIF NEW.result > 65 AND NEW.result <76 THEN SET temp := 4;
ELSEIF NEW.result > 75 AND NEW.result <86 THEN SET temp := 5;
ELSEIF NEW.result > 85 AND NEW.result <101 THEN SET temp := 6;
END IF;
INSERT INTO class_student(id,class_id,student_id) VALUES (NEW.class_student_id,temp,NEW.class_student_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `sign` char(2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `level`
--

INSERT INTO `level` (`id`, `sign`, `name`) VALUES
(1, 'A1', 'A1'),
(2, 'A2', 'A2'),
(3, 'B1', 'B1'),
(4, 'B2', 'B2'),
(5, 'C1', 'C1'),
(6, 'C2', 'C2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `tc` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `student`
--

INSERT INTO `student` (`id`, `name`, `surname`, `email`, `phone`, `tc`) VALUES
(1, 'e', 'e', 'e', 123, 123123);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_account`
--

CREATE TABLE `student_account` (
  `id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `tc` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `surname`, `email`, `phone`, `tc`) VALUES
(1, 'Osman', 'Barut', 'ossbarut@windowslive.com', 5316695542, 21512458965),
(2, 'Cemile', 'Barut', 'cembarut@windowslive.com', 5316695543, 21512458966),
(3, 'Mete', 'Barut', 'metbarut@windowslive.com', 5316695544, 21512458967),
(4, 'Ali', 'Barut', 'kaptanbarut@windowslive.com', 5316695545, 21512458968),
(5, 'Caroline', 'Barut', 'carbarut@windowslive.com', 5316695546, 21512458969),
(6, 'Jessica', 'Barut', 'jesbarut@windowslive.com', 5316695547, 21512458960);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teacher_account`
--

CREATE TABLE `teacher_account` (
  `id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Tablo için indeksler `class_student`
--
ALTER TABLE `class_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Tablo için indeksler `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`);

--
-- Tablo için indeksler `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_student_id` (`class_student_id`);

--
-- Tablo için indeksler `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `student_account`
--
ALTER TABLE `student_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Tablo için indeksler `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `teacher_account`
--
ALTER TABLE `teacher_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `class_student`
--
ALTER TABLE `class_student`
  ADD CONSTRAINT `class_student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_student_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`class_student_id`) REFERENCES `class_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `student_account`
--
ALTER TABLE `student_account`
  ADD CONSTRAINT `student_account_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `teacher_account`
--
ALTER TABLE `teacher_account`
  ADD CONSTRAINT `teacher_account_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
