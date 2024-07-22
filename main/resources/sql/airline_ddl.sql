CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerStatus VARCHAR(50)
);

CREATE TABLE Flights (
    FlightNumber VARCHAR(10) PRIMARY KEY,
    Aircraft VARCHAR(100),
    TotalAircraftSeats INT,
    FlightMileage INT
);

CREATE TABLE CustomerFlights (
    CustomerID INT,
    FlightNumber VARCHAR(10),
    TotalCustomerMileage INT,
    PRIMARY KEY (CustomerID, FlightNumber),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlightNumber) REFERENCES Flights(FlightNumber)
);

INSERT INTO Customers (CustomerName, CustomerStatus) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT INTO Flights (FlightNumber, Aircraft, TotalAircraftSeats, FlightMileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

INSERT INTO CustomerFlights (CustomerID, FlightNumber, TotalCustomerMileage) VALUES
(1, 'DL143', 115235),
(1, 'DL122', 115235),
(2, 'DL122', 6008),
(3, 'DL122', 205767),
(3, 'DL53', 205767),
(4, 'DL143', 2653),
(5, 'DL143', 127656),
(5, 'DL122', 127656),
(6, 'DL222', 136773),
(7, 'DL222', 300582),
(8, 'DL222', 14642),
(4, 'DL37', 2653);
