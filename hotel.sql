-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 29 Αυγ 2023 στις 16:30:24
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `hotel`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `ReservationID` int(11) DEFAULT NULL,
  `PaymentMethod` varchar(100) DEFAULT NULL,
  `CardNumber` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `payments`
--

INSERT INTO `payments` (`PaymentID`, `ReservationID`, `PaymentMethod`, `CardNumber`) VALUES
(23, 28, 'ΚΑΡΤΑ', '123456789'),
(24, 29, 'ΜΕΤΡΗΤΑ', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `reservations`
--

CREATE TABLE `reservations` (
  `ReservationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RoomNumber` varchar(100) NOT NULL,
  `CheckInDate` date NOT NULL,
  `CheckOutDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `reservations`
--

INSERT INTO `reservations` (`ReservationID`, `UserID`, `RoomNumber`, `CheckInDate`, `CheckOutDate`) VALUES
(28, 1, '104', '2023-08-25', '2023-08-25'),
(29, 3, '106', '2023-08-25', '2023-08-27');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `rooms`
--

CREATE TABLE `rooms` (
  `RoomNumber` varchar(100) NOT NULL,
  `RoomType` varchar(100) DEFAULT NULL,
  `Capacity` int(100) DEFAULT NULL,
  `PricePerNight` decimal(10,2) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `FloorNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `rooms`
--

INSERT INTO `rooms` (`RoomNumber`, `RoomType`, `Capacity`, `PricePerNight`, `Availability`, `FloorNumber`) VALUES
('103', 'Δίκλινο', 2, 200.00, 1, 2),
('104', 'Μονόκλινο', 1, 100.00, 1, 1),
('106', 'Μονόκλινο', 1, 12.00, 1, 310),
('107', 'Οικογενειακό δωμάτιο', 4, 300.00, 1, 3),
('108', 'Σουΐτα', 8, 400.00, 1, 4);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL,
  `GENDER` varchar(100) DEFAULT NULL,
  `NATIONALITY` varchar(100) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`ID`, `NAME`, `EMAIL`, `PHONE`, `ADDRESS`, `USERNAME`, `PASSWORD`, `CATEGORY`, `GENDER`, `NATIONALITY`, `BIRTHDAY`) VALUES
(1, 'Κατερίνα Σφακιανού', 'katsfak10@gmail.com', '2107784592', 'Α. Παναγούλη 23', 'katsfak', 'aaa12345', 'CUSTOMER', 'Θηλυκό', 'Ελληνική', '2002-11-16'),
(2, 'admin', 'Adminhotel@gmail.com', NULL, NULL, 'admin', 'admin', 'ADMIN', NULL, NULL, NULL),
(3, 'Γρηγόρης Σφακιανός', 'gregory12@gmail.com', '6969696969', 'Νέα Μάκρη', 'greg', '12345', 'CUSTOMER', 'Αρσενικό', 'Ελληνική', '2002-11-18'),
(5, 'Παναγιώτης', 'pansfak@gmail.com', '2107784592', 'Α.Παναγούλη 23', 'pan', '12345', 'CUSTOMER', 'Αρσενικό', 'Ελληνική', '1997-08-01');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `payments_ibfk_1` (`ReservationID`);

--
-- Ευρετήρια για πίνακα `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `reservations_ibfk_1` (`UserID`),
  ADD KEY `reservations_ibfk_2` (`RoomNumber`);

--
-- Ευρετήρια για πίνακα `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomNumber`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT για πίνακα `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservations` (`ReservationID`);

--
-- Περιορισμοί για πίνακα `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`RoomNumber`) REFERENCES `rooms` (`RoomNumber`);

DELIMITER $$
--
-- Συμβάντα
--
CREATE DEFINER=`root`@`localhost` EVENT `update_room_availability` ON SCHEDULE EVERY 1 DAY STARTS '2023-08-29 17:27:04' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE rooms SET Availability = true WHERE RoomNumber IN (SELECT RoomNumber FROM reservations WHERE CheckOutDate < CURDATE())$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
