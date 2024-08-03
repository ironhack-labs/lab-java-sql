
CREATE TABLE Authors (
                         AuthorID INT PRIMARY KEY AUTO_INCREMENT,
                         AuthorName VARCHAR(255) NOT NULL
);


CREATE TABLE Posts (
                       PostID INT PRIMARY KEY AUTO_INCREMENT,
                       AuthorID INT,
                       Title VARCHAR(255) NOT NULL,
                       WordCount INT,
                       Views INT,
                       FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);



CREATE TABLE Customers (
                           CustomerID INT PRIMARY KEY AUTO_INCREMENT,
                           CustomerName VARCHAR(255) NOT NULL,
                           CustomerStatus VARCHAR(50)
);


CREATE TABLE Flights (
                         FlightNumber VARCHAR(10) PRIMARY KEY,
                         Aircraft VARCHAR(50),
                         TotalAircraftSeats INT,
                         FlightMileage INT
);


CREATE TABLE CustomerFlights (
                                 CustomerID INT,
                                 FlightNumber VARCHAR(10),
                                 TotalCustomerMileage INT,
                                 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
                                 FOREIGN KEY (FlightNumber) REFERENCES Flights(FlightNumber),
                                 PRIMARY KEY (CustomerID, FlightNumber)
);


SELECT COUNT(DISTINCT FlightNumber) AS TotalFlights
FROM CustomerFlights;

SELECT AVG(FlightMileage) AS AverageFlightDistance
FROM Flights;

SELECT AVG(TotalAircraftSeats) AS AverageSeats
FROM Flights;

SELECT c.CustomerStatus, AVG(cf.TotalCustomerMileage) AS AverageMiles
FROM CustomerFlights cf
         JOIN Customers c ON cf.CustomerID = c.CustomerID
GROUP BY c.CustomerStatus;

SELECT c.CustomerStatus, MAX(cf.TotalCustomerMileage) AS MaxMiles
FROM CustomerFlights cf
         JOIN Customers c ON cf.CustomerID = c.CustomerID
GROUP BY c.CustomerStatus;

SELECT COUNT(DISTINCT Aircraft) AS TotalBoeingAircraft
FROM Flights
WHERE Aircraft LIKE '%Boeing%';

SELECT FlightNumber, FlightMileage
FROM Flights
WHERE FlightMileage BETWEEN 300 AND 2000;

SELECT c.CustomerStatus, AVG(f.FlightMileage) AS AverageFlightDistance
FROM CustomerFlights cf
         JOIN Customers c ON cf.CustomerID = c.CustomerID
         JOIN Flights f ON cf.FlightNumber = f.FlightNumber
GROUP BY c.CustomerStatus;

SELECT f.Aircraft, COUNT(*) AS BookingCount
FROM CustomerFlights cf
         JOIN Customers c ON cf.CustomerID = c.CustomerID
         JOIN Flights f ON cf.FlightNumber = f.FlightNumber
WHERE c.CustomerStatus = 'Gold'
GROUP BY f.Aircraft
ORDER BY BookingCount DESC
    LIMIT 1;
