INSERT INTO Bookings (BookingsID,BookingsDate,TableNo,CustomerID,StaffID)
Values 
(1,'2022-10-10',5,1,2),
(2,'2022-11-12',3,3,3),
(3,'2022-10-11',2,2,1),
(4,'2022-10-13',2,1,1)

DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN bookingDate DATE,IN tableNo INT)
BEGIN
    DECLARE isTableBooked INT;
    
    SELECT COUNT(*) INTO isTableBooked
    FROM Bookings
    WHERE BookingsDate = bookingDate AND TableNo = tableNo;
    
    IF isTableBooked > 0 THEN
        SELECT concat('Table ', tableNo ,' is already booked') AS Status;
    ELSE
        SELECT 'Table is available for booking' AS Status;
    END IF;
END //
DELIMITER ;

call CheckBooking('2022-10-10',3);

 DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN pBookingDate DATE, IN pTableNo INT)
BEGIN
    DECLARE tableBooked INT;
    
    START TRANSACTION;
    
    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO tableBooked
    FROM Bookings
    WHERE BookingsDate = pBookingDate AND TableNo = pTableNo;
    
    IF tableBooked > 0 THEN
        -- The table is already booked; rollback the transaction
        ROLLBACK;
        SELECT 'Booking declined. Table is already booked on this date.' AS Status;
    ELSE
        -- The table is available; add a new booking
        INSERT INTO Bookings (BookingsDate, TableNo)
        VALUES (pBookingDate, pTableNo);
        
        -- Commit the transaction
        COMMIT;
        SELECT 'Booking successful.' AS Status;
    END IF;
    
END //
DELIMITER ;

call AddValidBooking('2022-10-10',5)

