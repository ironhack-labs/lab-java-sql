USE Airlines;

SELECT COUNT(*) 
FROM Flight;

SELECT AVG(Mileage) 
FROM Flight;

SELECT AVG(Seats) 
FROM Aircraft;

SELECT Status, AVG(TotalMileage) 
FROM Customer
GROUP BY Status;

SELECT Status, MAX(TotalMileage) 
FROM Customer
GROUP BY Status;


SELECT COUNT(*) 
FROM Aircraft
WHERE NAME LIKE '%Boeing%';


SELECT ID, FlightNumber, Mileage
FROM Flight
WHERE Mileage BETWEEN 300 AND 2000;


SELECT Customer.Status, AVG(Flight.Mileage)
FROM FlightBooking
INNER JOIN Customer ON FlightBooking.CustomerID = Customer.ID
INNER JOIN Flight ON FlightBooking.FlightID = Flight.ID
GROUP BY Customer.Status;

SELECT Aircraft.Name, COUNT(*) AS Count
FROM Aircraft
INNER JOIN Flight ON Aircraft.ID = Flight.AircraftID
INNER JOIN FlightBooking ON Flight.ID = FlightBooking.FlightID
INNER JOIN Customer ON Ticket.CustomerID = Customer.ID
WHERE Customer.Status = 'Gold'
GROUP BY Aircraft.Name
ORDER BY Count DESC
LIMIT 1;
