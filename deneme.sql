-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 27, 2020 at 12:47 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deneme`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `teacher_id` bigint(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `level_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `date`, `student_id`, `result`) VALUES
(1, '2020-03-04', 12131, 50),
(1, '2020-03-04', 12131, 50),
(9898, '2020-03-11', 137, 44),
(9898989, '2020-03-10', 111, 44),
(1, '2020-03-10', 137, 75),
(1, '2020-03-02', 111, 75),
(1, '2020-03-03', 12131, 44),
(9898989, '2020-03-04', 137, 75),
(1, '2020-03-02', 111, 76),
(9898989, '2020-03-03', 12131, 74),
(1, '2020-03-04', 111, 99),
(1, '2020-03-03', 111, 84);

--
-- Triggers `exam`
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
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `grade` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `grade`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'B1'),
(4, 'B2'),
(5, 'C1'),
(6, 'C2');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `tc` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`tc`, `name`, `surname`, `email`, `phone`) VALUES
(111, 'alperen', 'karaman', 'eakaraman1@gmail.ocm', 5330901109),
(137, 'alperen', 'karaman', 'eakaraman1@gmail.ocm', 5330901109),
(12131, 'enes', 'karaman', 'eaka', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `student_level`
--

CREATE TABLE `student_level` (
  `id` bigint(11) NOT NULL,
  `level` varchar(2) NOT NULL,
  `last_result` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_level`
--

INSERT INTO `student_level` (`id`, `level`, `last_result`) VALUES
(137, 'B2', 0),
(12131, 'B2', 0),
(111, 'C1', 84);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `surname`, `email`, `phone`) VALUES
(0, '', '', '', ''),
(4, 'qwe', 'q', 'qwe', 'qwe'),
(42635, 'enbes klaraman', 'sad', 'ead', '12321'),
(134252523, 'sezgin', 'muslu', 'eaklar', '0533030'),
(2147483647, 'enes', 'karaman', 'eakaraman', '05330901109'),
(13725014610, 'nes', 'karaman', 'eakara', '05330901109'),
(13725014611, 'nes', 'karaman', 'eakara', '05330901109');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_account`
--

CREATE TABLE `teacher_account` (
  `id` bigint(11) NOT NULL,
  `working` tinyint(1) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_account`
--

INSERT INTO `teacher_account` (`id`, `working`, `login`, `password`) VALUES
(4, 1, 'q', 'q'),
(42635, 0, 'weqwe', 'qwe'),
(134252523, 0, 'smuslu', 'sdsa'),
(2147483647, 1, 'eakarman', 'logi'),
(13725014610, 1, 'eakaraman', 'asdasd'),
(13725014611, 0, 'eakaraman', 'asdasd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `level_id_2` (`level_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`tc`);

--
-- Indexes for table `student_level`
--
ALTER TABLE `student_level`
  ADD KEY `id` (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_account`
--
ALTER TABLE `teacher_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`tc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_level`
--
ALTER TABLE `student_level`
  ADD CONSTRAINT `student_level_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`tc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_account`
--
ALTER TABLE `teacher_account`
  ADD CONSTRAINT `teacher_account_ibfk_1` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
