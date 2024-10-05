
// Instructions 1
// 1 Normalize the following blog database and write the DDL scripts to create the database tables:

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);


CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_name)
VALUES ('Maria Charlotte'),
       ('Juan Perez'),
       ('Gemma Alcocer');


-- Inserting data into the Posts table
INSERT INTO Posts (author_id, title, word_count, views)
VALUES 
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Best Paint Colors', 814, 14),
((SELECT author_id FROM Authors WHERE author_name = 'Juan Perez'), 'Small Space Decorating Tips', 1146, 221),
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Hot Accessories', 986, 105),
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Mixing Textures', 765, 22),
((SELECT author_id FROM Authors WHERE author_name = 'Juan Perez'), 'Kitchen Refresh', 1242, 307),
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Homemade Art Hacks', 1002, 193),
((SELECT author_id FROM Authors WHERE author_name = 'Gemma Alcocer'), 'Refinishing Wood Floors', 1571, 7542);


// Instructions 2

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    CustomerStatus VARCHAR(20)
);
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(20),
    AircraftID INT,
    TotalAircraftSeats INT,
    FlightMileage INT,
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)
);
CREATE TABLE Aircraft (
    AircraftID INT PRIMARY KEY AUTO_INCREMENT,
    AircraftModel VARCHAR(50)
);
CREATE TABLE Customer_Flight (
    CustomerFlightID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    FlightID INT,
    TotalCustomerMileage INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

INSERT INTO Aircraft (AircraftModel)
VALUES 
('Boeing 747'),
('Airbus A330'),
('Boeing 777');

INSERT INTO Flight (FlightNumber, AircraftID, TotalAircraftSeats, FlightMileage)
VALUES
('DL143', 1, 400, 135),
('DL122', 2, 236, 4370),
('DL53', 3, 264, 2078),
('DL222', 3, 264, 1765),
('DL37', 1, 400, 531);

INSERT INTO Customer (CustomerName, CustomerStatus)
VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT INTO Customer_Flight (CustomerID, FlightID, TotalCustomerMileage)
VALUES
(1, 1, 115235),
(1, 2, 115235),
(2, 2, 6008),
(1, 1, 115235),
(3, 2, 205767),
(3, 3, 205767),
(1, 1, 115235),
(4, 1, 2653),
(1, 1, 115235),
(3, 4, 205767),
(5, 1, 127656),
(4, 1, 2653),
(6, 4, 136773),
(7, 4, 300582),
(5, 2, 127656),
(4, 5, 2653),
(8, 4, 14642);

// Instructions 3

SELECT COUNT(*) AS TotalFlights
FROM Flight;

// SQL Queries for Average Flight Distance

SELECT AVG(FlightMileage) AS AverageFlightDistance
FROM Airline;

// SQL Queries for Average Number of Seats

SELECT AVG(TotalAircraftSeats) AS AverageSeats
FROM Airline;

//SQL Queries for Average Number of Miles Flown by Customers Grouped by Status

SELECT CustomerStatus, AVG(TotalCustomerMileage) AS AverageMileage
FROM Airline
GROUP BY CustomerStatus;

// SQL Queries for Maximum Number of Miles Flown by Customers Grouped by Status
SELECT CustomerStatus, MAX(TotalCustomerMileage) AS MaxMileage
FROM Airline
GROUP BY CustomerStatus;


// SQL Queries for Total Number of Aircraft with Name Containing Boeing
SELECT COUNT(DISTINCT Aircraft) AS TotalBoeingAircraft
FROM Airline
WHERE Aircraft LIKE '%Boeing%';


// SQL Queries for Flights with Distance Between 300 and 2000 Miles
SELECT FlightNumber, Aircraft, FlightMileage
FROM Airline
WHERE FlightMileage BETWEEN 300 AND 2000;


// SQL Queries for Average Flight Distance Booked Grouped by Customer Status

SELECT CustomerStatus, AVG(FlightMileage) AS AvgFlightDistance
FROM Airline
GROUP BY CustomerStatus;

// SQL Queries for Most Often Booked Aircraft by Gold Members
SELECT Aircraft, COUNT(Aircraft) AS BookedCount
FROM Airline
WHERE CustomerStatus = 'Gold'
GROUP BY Aircraft
ORDER BY BookedCount DESC
LIMIT 1;
