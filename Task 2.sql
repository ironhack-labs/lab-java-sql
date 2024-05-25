CREATE DATABASE Flight;
use Flight;

CREATE TABLE Customers (
                           CustomerID INT PRIMARY KEY AUTO_INCREMENT,
                           CustomerName VARCHAR(50) NOT NULL,
                           CustomerStatus VARCHAR(20),
                           TotalCustomerMileage INT
);

CREATE TABLE Aircraft (
                          AircraftID INT PRIMARY KEY AUTO_INCREMENT,
                          AircraftName VARCHAR(50) NOT NULL,
                          TotalSeats INT NOT NULL
);

CREATE TABLE Flights (
                         FlightID INT PRIMARY KEY AUTO_INCREMENT,
                         FlightNumber VARCHAR(10) NOT NULL,
                         AircraftID INT NOT NULL,
                         FlightMileage INT NOT NULL,
                         FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)
);

CREATE TABLE CustomerFlights (
                                 CustomerID INT NOT NULL,
                                 FlightID INT NOT NULL,
                                 PRIMARY KEY (CustomerID, FlightID),
                                 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
                                 FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);



INSERT INTO Customers (CustomerName, CustomerStatus, TotalCustomerMileage)
VALUES
    ('Augustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', 'None', 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', 'None', 2653),
    ('Jessica James', 'Silver', 127656),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Christian Janco', 'Silver', 14642);

INSERT INTO Aircraft (AircraftName, TotalSeats)
VALUES
    ('Boeing 747', 400),
    ('Airbus A330', 236),
    ('Boeing 777', 264);

INSERT INTO Flights (FlightNumber, AircraftID, FlightMileage)
VALUES
    ('DL143', (SELECT AircraftID FROM Aircraft WHERE AircraftName = 'Boeing 747'), 135),
    ('DL122', (SELECT AircraftID FROM Aircraft WHERE AircraftName = 'Airbus A330'), 4370),
    ('DL53', (SELECT AircraftID FROM Aircraft WHERE AircraftName = 'Boeing 777'), 2078),
    ('DL222', (SELECT AircraftID FROM Aircraft WHERE AircraftName = 'Boeing 777'), 1765),
    ('DL37', (SELECT AircraftID FROM Aircraft WHERE AircraftName = 'Boeing 747'), 531);

INSERT INTO CustomerFlights (CustomerID, FlightID)
VALUES
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Augustine Riviera'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL143')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Augustine Riviera'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL122')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Alaina Sepulvida'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL122')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Tom Jones'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL122')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Tom Jones'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL53')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Sam Rio'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL143')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Tom Jones'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL222')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Jessica James'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL143')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Ana Janco'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL222')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Jennifer Cortez'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL222')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Jessica James'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL122')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Sam Rio'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL37')),
    ((SELECT CustomerID FROM Customers WHERE CustomerName = 'Christian Janco'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL222'));

SELECT * FROM Customers;
SELECT * from flights;
SELECT * from customerflights;

SELECT COUNT(*) AS TotalFlights FROM Flights;

SELECT AVG(FlightMileage) AS AverageFlightDistance FROM Flights;

SELECT AVG(TotalSeats) AS AverageSeats FROM Aircraft;

SELECT c.CustomerStatus, AVG(c.TotalCustomerMileage)
AS AverageMilesByStatus
FROM Customers c
GROUP BY c.CustomerStatus;

SELECT c.CustomerStatus, MAX(c.TotalCustomerMileage) AS MaxMilesByStatus
FROM Customers c
GROUP BY c.CustomerStatus;

SELECT COUNT(*) AS TotalBoeingAircraft
FROM Aircraft
WHERE AircraftName LIKE '%Boeing%';

SELECT *
FROM Flights
WHERE FlightMileage BETWEEN 300 AND 2000;

SELECT
    c.CustomerStatus,
    AVG(f.FlightMileage) AS AverageFlightDistance
FROM
    Customers c
        JOIN CustomerFlights cf ON c.CustomerID = cf.CustomerID
        JOIN Flights f ON cf.FlightID = f.FlightID
GROUP BY
    c.CustomerStatus;

SELECT
    a.AircraftName,
    COUNT(*) AS BookingCount
FROM
    Customers c
        JOIN CustomerFlights cf ON c.CustomerID = cf.CustomerID
        JOIN Flights f ON cf.FlightID = f.FlightID
        JOIN Aircraft a ON f.AircraftID = a.AircraftID
WHERE
    c.CustomerStatus = 'Gold'
GROUP BY
    a.AircraftName
ORDER BY
    BookingCount DESC
LIMIT 1;