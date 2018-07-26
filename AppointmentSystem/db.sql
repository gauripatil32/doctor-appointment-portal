-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2017 at 09:21 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctorappointmentsystem`
--
CREATE DATABASE IF NOT EXISTS `bikaner` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bikaner`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `prescription` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appid`, `patientid`, `doctorid`, `date`, `time`, `prescription`) VALUES
(1, 3, 4, '2016-04-08', '10:00:00.000000', 'Diabetes '),
(6, 3, 2, '2016-04-19', '17:00:00.000000', 'Heart problem'),
(9, 3, 2, '2016-04-17', '11:00:00.000000', ''),
(31, 1, 3, '2017-03-14', '09:30:00.000000', '');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `email` varchar(50) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `starttime` time(6) NOT NULL,
  `endtime` time(6) NOT NULL,
  `specialization` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`email`, `doctorid`, `starttime`, `endtime`, `specialization`) VALUES
('hthakkar@uncc.edu', 2, '10:00:00.000000', '18:00:00.000000', 'Family Physician'),
('jbond@uncc.edu', 3, '09:00:00.000000', '12:00:00.000000', 'Cancer Specialist'),
('ssetturu@uncc.edu', 4, '08:00:00.000000', '16:00:00.000000', 'Neuromuscular');

-- --------------------------------------------------------

--
-- Table structure for table `doctorreview`
--

CREATE TABLE `doctorreview` (
  `docreviewid` int(10) NOT NULL,
  `appid` int(11) NOT NULL,
  `rating` int(5) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorreview`
--

INSERT INTO `doctorreview` (`docreviewid`, `appid`, `rating`, `review`) VALUES
(1, 1, 3, 'Good'),
(6, 6, 3, 'Rude and strict'),
(9, 9, 4, 'Helpful');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `role`) VALUES
('abc@uncc.edu', 'abc', 'patient'),
('hthakkar@uncc.edu', 'hardik', 'doctor'),
('jbond@uncc.edu', 'james', 'doctor'),
('john@uncc.edu', 'john', 'receptionist'),
('ksavakia@uncc.edu', 'khyati', 'patient'),
('nmodi@uncc.edu', 'narendra', 'receptionist'),
('ssetturu@uncc.edu', 'sree', 'doctor'),
('test@uncc.edu', 'test', 'patient'),
('tshetty1@uncc.edu', 'triveni', 'patient'),
('vinayak@uncc.edu', 'vinayak', 'receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `predoctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `email`, `predoctor`) VALUES
(1, 'ksavakia@uncc.edu', 'hthakkar@uncc.edu'),
(3, 'tshetty1@uncc.edu', 'jbond@uncc.edu'),
(12, 'abc@uncc.edu', 'hthakkar@uncc.edu');

-- --------------------------------------------------------

--
-- Table structure for table `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `paymendid` int(50) NOT NULL,
  `appid` int(50) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenthistory`
--

INSERT INTO `paymenthistory` (`paymendid`, `appid`, `amount`) VALUES
(2, 1, 150);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `streetaddress` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`email`, `fname`, `lname`, `gender`, `phonenumber`, `dob`, `streetaddress`, `city`, `state`, `pincode`, `role`) VALUES
('abc@uncc.edu', 'abc', 'xyz', 'Female', '9990099900', '1990-05-16', '9501', 'Charlotte', 'NC', '28262', 'patient'),
('hthakkar@uncc.edu', 'Hardil', 'Thakkar', 'Male', '1232345612', '1992-09-09', '1001 Ashford', 'Charlotte', 'NC', '28765', 'doctor'),
('jbond@uncc.edu', 'James', 'Bond', 'Male', '1234567654', '1898-07-02', 'Cali street', 'New York', 'New York', '23451', 'doctor'),
('john@uncc.edu', 'John', 'Jahan', 'Male', '1231231234', '1999-03-05', '1234 street view', 'Dallas', 'Texas', '123211', 'receptionist'),
('ksavakia@uncc.edu', 'Khyati', 'Savakia', 'Female', '1234345678', '1991-03-04', '9548 UT Drive', 'Charlotte', 'NC', '29262', 'patient'),
('nmodi@uncc.edu', 'Narendra', 'Modi', 'Male', '1324567890', '1967-04-05', 'Khav gali', 'Raliegh', 'NC', '43256', 'receptionist'),
('ssetturu@uncc.edu', 'Sreelakshmi', 'Setturu', 'Female', '1234345678', '1997-04-07', '9548 UT North', 'Charlotte', 'NC', '45678', 'doctor'),
('test@uncc.edu', 'Test', 'Test', 'Female', '2012345666', '1991-05-07', '3456 north drive', 'Charlotte', 'NC', '28262', 'patient'),
('tshetty1@uncc.edu', 'Triveni', 'Shetty', 'Female', '1234234234', '1993-05-06', '9678 Ut Drice', 'Charlotte', 'NC', '23145', 'patient'),
('vinayak@uncc.edu', 'Vinayak', 'K', 'Male', '128765432', '1989-05-06', '2345 United Drive', 'Charlotte', 'NC', '34562', 'receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `email` varchar(50) NOT NULL,
  `receptionid` int(11) NOT NULL,
  `shift` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`email`, `receptionid`, `shift`) VALUES
('john@uncc.edu', 1, 'morning'),
('nmodi@uncc.edu', 2, 'afternoon'),
('vinayak@uncc.edu', 3, 'night');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `doctorid` (`doctorid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `doctorreview`
--
ALTER TABLE `doctorreview`
  ADD PRIMARY KEY (`docreviewid`),
  ADD UNIQUE KEY `appid` (`appid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `email_2` (`email`),
  ADD KEY `predoctor` (`predoctor`);

--
-- Indexes for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD PRIMARY KEY (`paymendid`),
  ADD UNIQUE KEY `appid_2` (`appid`),
  ADD KEY `appid` (`appid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`receptionid`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `doctorreview`
--
ALTER TABLE `doctorreview`
  MODIFY `docreviewid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `paymendid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `receptionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`);

--
-- Constraints for table `doctorreview`
--
ALTER TABLE `doctorreview`
  ADD CONSTRAINT `doctorreview_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appid`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`predoctor`) REFERENCES `doctor` (`email`);

--
-- Constraints for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD CONSTRAINT `paymenthistory_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appid`);

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
