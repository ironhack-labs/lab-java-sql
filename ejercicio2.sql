CREATE DATABASE example_lab_sql_exercise2;
USE example_lab_sql_exercise2;

-- Customers Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255),
    CustomerStatus VARCHAR(50),
    TotalCustomerMileage INT
);

-- Flights Table
CREATE TABLE Flight (
    FlightNumber VARCHAR(10) PRIMARY KEY,
    Aircraft VARCHAR(50),
    TotalAircraftSeats INT,
    FlightMileage INT
);

-- Customer Flights Table
CREATE TABLE CustomerFlight (
    CustomerFlightID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    FlightNumber VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
);



-- Inserts para la tabla Customer
INSERT INTO Customer (CustomerName, CustomerStatus, TotalCustomerMileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

-- Inserts para la tabla Flight
INSERT INTO Flight (FlightNumber, Aircraft, TotalAircraftSeats, FlightMileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

-- Inserts para la tabla CustomerFlight
INSERT INTO CustomerFlight (CustomerID, FlightNumber) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(1, 'DL143'),
(3, 'DL122'),
(3, 'DL53'),
(1, 'DL143'),
(4, 'DL143'),
(5, 'DL122'),
(5, 'DL143'),
(6, 'DL222'),
(7, 'DL222'),
(8, 'DL222'),
(8, 'DL222'),
(5, 'DL122'),
(9, 'DL143'),
(10, 'DL143'),
(11, 'DL143'),
(4, 'DL37'),
(12, 'DL222'),
(13, 'DL222'),
(14, 'DL222'),
(15, 'DL222'),
(5, 'DL37');


-- In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*) AS totalFlights From Flight; -- In the Airline database write the SQL script to get the total number of flights in the database.

-- In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(FlightMileage) as AverageFlightDistance From Flight;

-- In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(TotalAircraftSeats) as AverageTotalAircraftSeats From Flight;

-- In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT CustomerStatus, MAX(TotalCustomerMileage) as MaxMilesFlown
FROM Customer GROUP BY(CustomerStatus);

-- In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*) FROM Flight WHERE Aircraft LIKE "%Boeing%";

-- In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT FlightNumber, Aircraft From FLight  WHERE FlightMileage BETWEEN 200 AND 2000;

-- In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join);
SELECT Customer.CustomerStatus, AVG(Flight.FlightMileage) AS AverageFlightDistance
FROM CustomerFlight
JOIN Customer ON CustomerFlight.CustomerID = Customer.CustomerID
JOIN Flight ON CustomerFlight.FlightNumber = Flight.FlightNumber
GROUP BY CustomerStatus;

-- In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join);
SELECT Flight.Aircraft, COUNT(*) AS ReservationCount
FROM Customer
JOIN CustomerFlight ON Customer.CustomerID = CustomerFlight.CustomerID
JOIN Flight  ON CustomerFlight.FlightNumber = Flight.FlightNumber
WHERE Customer.CustomerStatus = 'Gold'
GROUP BY Flight.Aircraft
ORDER BY ReservationCount DESC;


