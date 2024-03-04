DROP database IF EXISTS labflights;
create database labflights;
USE labflights;

CREATE TABLE Customers(
id int NOT NULL AUTO_INCREMENT,
name varchar(255) NOT NULL,
status varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Flights(
id int NOT NULL AUTO_INCREMENT,
flight_number varchar(255) NOT NULL,
aircraft varchar(255) NOT NULL,
total_seats int NOT NULL,
flight_mileage int NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE CustomerFlights(
id int NOT NULL AUTO_INCREMENT,
CustomerID int NOT NULL,
FlightID int NOT NULL,
total_customer_mileage int,
FOREIGN KEY (CustomerID) REFERENCES Customers(id),
FOREIGN KEY (FlightID) REFERENCES Flights(id),
PRIMARY KEY (id)
);

INSERT INTO Customers (name, status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida','None'),
('Tom Jones','Gold'),
('Sam Rio','None'),
('Jessica James','Silver'),
('Sam Rio','None'),
('Ana Janco','Silver'),
('Jennifer Cortez','Gold'),
('Christian Janco','Silver');

INSERT INTO Flights (flight_number, aircraft, total_seats, flight_mileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL122', 'Airbus A330', 236, 4370),
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL143', 'Boeing 747', 400, 135),
('DL143', 'Boeing 747', 400, 135),
('DL222', 'Boeing 777', 264, 1765),
('DL143', 'Boeing 747', 400, 135),
('DL222', 'Boeing 777', 264, 1765),
('DL222', 'Boeing 777', 264, 1765),
('DL122', 'Airbus A330', 236, 4370),
('DL37', 'Boeing 747', 400, 531);

INSERT INTO CustomerFlights (CustomerID, FlightID, total_customer_mileage) VALUES
(1, 1, 115235),
(1, 2, 115235),
(2, 2, 6008),
(1, 1, 115235),
(3, 2, 205767),
(3, 6, 205767),
(1, 1, 115235),
(4, 1, 2653),
(1, 1, 115235),
(3, 9, 205767),
(5, 1, 127656),
(4, 1, 2653),
(7, 9, 136773),
(8, 9, 300582),
(5, 2, 127656),
(4, 13, 2653),
(9, 9, 14642);

SELECT COUNT(*) AS total_flights FROM Flights;
SELECT AVG(flight_mileage) FROM Flights;
SELECT AVG(total_seats) FROM Flights;
SELECT Customers.status, AVG(CustomerFlights.total_customer_mileage) FROM Customers JOIN CustomerFlights ON Customers.id = CustomerFlights.CustomerID GROUP BY Customers.status;
SELECT Customers.status, MAX(CustomerFlights.total_customer_mileage) FROM Customers JOIN CustomerFlights ON Customers.id = CustomerFlights.CustomerID GROUP BY Customers.status;
SELECT * FROM Flights WHERE flight_mileage BETWEEN 300 AND 2000;
SELECT Customers.status, AVG(Flights.flight_mileage) FROM Customers JOIN CustomerFlights ON Customers.id = CustomerFlights.CustomerID JOIN Flights ON CustomerFlights.FlightID GROUP BY Customers.status;
SELECT Flights.aircraft, COUNT(*) FROM Customers JOIN CustomerFlights ON Customers.id = CustomerFlights.CustomerID JOIN Flights ON CustomerFlights.FlightID = Flights.id WHERE Customers.status LIKE 'Gold' GROUP BY Flights.aircraft ORDER BY COUNT(*) DESC LIMIT 1; 