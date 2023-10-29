-- DROP PROCEDURE IF EXISTS AddBooking;
-- DELIMITER //
-- create procedure AddBooking(IN bookingID int,IN bookingDate date ,IN customerID int,IN  tableNO int,IN staffID int)
-- BEGIN
-- INSERT INTO Bookings(BookingsID,BookingsDate,TableNo,CustomerID,StaffID)
-- VALUES (bookingID,bookingDate,customerID, tableNO,staffID);

-- SELECT 'New booking Added' AS Confirmation;
-- END //
-- DELIMITER ;

-- call AddBooking(11,'2022-03-21',2,1,1)

-- DROP PROCEDURE IF EXISTS UpdateBooking;
-- DELIMITER //
-- create procedure UpdateBooking (IN bookingID int,IN bookingDate date)
-- BEGIN
-- UPDATE Bookings SET BookingsDate = bookingDate WHERE BookingsID = bookingID;
-- SELECT concat('Booking ',bookingID,' updated') AS Confirmation;
-- END //
-- DELIMITER ;
-- call UpdateBooking(10,'2022-03-21')

-- DROP PROCEDURE IF EXISTS CancelBooking;
-- DELIMITER //
-- create procedure CancelBooking  (IN bookingID int)
-- BEGIN
-- DELETE fROM Bookings WHERE BookingsID = bookingID;
-- SELECT concat('Booking ',bookingID,' cancelled') AS Confirmation;
-- END //
-- DELIMITER ;
-- call CancelBooking (10)

