CREATE DATABASE ExerciseOne_db;
USE ExerciseOne_db;
CREATE TABLE  Books(
        id INT PRIMARY KEY,
        author VARCHAR(50),
title VARCHAR(100),
WordCount INT,
views INT
);

INSERT INTO Books(id, author, title, WordCount, views)
VALUES
        (1,'Maria Charlotte','Best Paint Colors',814,14),
    (2,'Juan Perez','Small Space Decorating Tips',1146,221),
            (3,'Maria Charlotte','Hot Accessories',986,105),
            (4,'Maria Charlotte','Mixing Textures',765,22),
            (5,'Juan Perez','Kitchen Refresh',1242,307),
            (6,'Maria Charlotte','Homemade Art Hacks',1002,193),
            (7,'Gemma Alcocer','Refinishing Wood Floors',1571,7542);

CREATE DATABASE ExerciseTwo_db
CREATE TABLE Customers (
        CustomerID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerName VARCHAR(255),
CustomerStatus VARCHAR(50),
TotalMileage INT
);

CREATE TABLE Flights (
        FlightID INT PRIMARY KEY AUTO_INCREMENT,
        FlightNumber VARCHAR(50),
FlightMileage INT
);

CREATE TABLE Aircrafts (
        AircraftID INT PRIMARY KEY AUTO_INCREMENT,
        AircraftName VARCHAR(100),
TotalSeats INT
);

CREATE TABLE CustomerFlights (
        CustomerFlightID INT PRIMARY KEY AUTO_INCREMENT,
        CustomerID INT,
        FlightID INT,
        Mileage INT,
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
        );

CREATE TABLE FlightAircrafts (
        FlightAircraftID INT PRIMARY KEY AUTO_INCREMENT,
        FlightID INT,
        AircraftID INT,
        FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
FOREIGN KEY (AircraftID) REFERENCES Aircrafts(AircraftID)
        );

INSERT INTO Customers (CustomerName, CustomerStatus, TotalMileage) VALUES
                                                                       ('Agustine Riviera', 'Silver', 115235),
                                                                               ('Alaina Sepulvida', 'None', 6008),
                                                                               ('Tom Jones', 'Gold', 205767),
                                                                               ('Sam Rio', 'None', 2653),
                                                                               ('Jessica James', 'Silver', 127656),
                                                                               ('Ana Janco', 'Silver', 136773),
                                                                               ('Jennifer Cortez', 'Gold', 300582),
                                                                               ('Christian Janco', 'Silver', 14642);

INSERT INTO Flights (FlightNumber, FlightMileage) VALUES
                                                      ('DL143', 135),
                                                              ('DL122', 4370),
                                                              ('DL53', 2078),
                                                              ('DL222', 1765),
                                                              ('DL37', 531);

INSERT INTO Aircrafts (AircraftName, TotalSeats) VALUES
                                                     ('Boeing 747', 400),
                                                             ('Airbus A330', 236),
                                                             ('Boeing 777', 264);

SELECT COUNT(*) AS TotalFlights
FROM Flights;

SELECT AVG(FlightMileage) AS AverageDistance
FROM Flights;

SELECT AVG(TotalSeats) AS AverageSeats
FROM Aircrafts;

        SELECT CustomerStatus, AVG(TotalMileage) AS AverageMiles
FROM Customers
GROUP BY CustomerStatus;

        SELECT CustomerStatus, MAX(TotalMileage) AS MaximumMiles
FROM Customers
GROUP BY CustomerStatus;

SELECT COUNT(*) AS TotalBoeingAircraft
FROM Aircrafts
WHERE AircraftName LIKE '%Boeing%';

        SELECT FlightNumber, FlightMileage
FROM Flights
WHERE FlightMileage BETWEEN 300 AND 2000;

SELECT c.CustomerStatus, AVG(f.FlightMileage) AS AverageDistance
FROM CustomerFlights cf
JOIN Customers c ON cf.CustomerID = c.CustomerID
JOIN Flights f ON cf.FlightID = f.FlightID
GROUP BY c.CustomerStatus;

SELECT a.AircraftName, COUNT(a.AircraftID) AS NumberOfBookings
FROM CustomerFlights cf
JOIN Customers c ON cf.CustomerID = c.CustomerID
JOIN FlightAircrafts fa ON cf.FlightID = fa.FlightID
JOIN Aircrafts a ON fa.AircraftID = a.AircraftID
WHERE c.CustomerStatus = 'Gold'
GROUP BY a.AircraftName
ORDER BY NumberOfBookings DESC
LIMIT 1;
