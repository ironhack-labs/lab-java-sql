CREATE DATABASE Airlines;
USE Airlines;

CREATE TABLE Aircraft (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
	Seats int NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Customer (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
	Status varchar(6) NOT NULL,
    TotalMileage int NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Flight (
    ID int NOT NULL AUTO_INCREMENT,
    AircraftID int NOT NULL,
    FlightNumber varchar(5) NOT NULL,
    Mileage int NOT NULL,
    PRIMARY KEY (ID),
	FOREIGN KEY (AircraftID) REFERENCES Aircraft(ID)
);

CREATE TABLE FlightBooking (
    ID int NOT NULL AUTO_INCREMENT,
    CustomerID int NOT NULL,
    FlightID int NOT NULL,
    PRIMARY KEY (ID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(ID),
	FOREIGN KEY (FlightID) REFERENCES Flight(ID)
);

INSERT INTO Aircraft (Name, Seats) VALUES
	('Boeing 747', 400),
	('Airbus A330', 236),	
    ('Boeing 777', 264);

INSERT INTO Customer (Name, Status, TotalMileage) VALUES
    ('Agustine Riviera', 'Silver', 115235),
	('Alaina Sepulvida', 'None', 6008),
	('Tom Jones', 'Gold', 205767),
	('Sam Rio', 'None', 2653),
	('Jessica James', 'Silver', 127656),
	('Ana Janco', 'Silver', 136773),
	('Jennifer Cortez', 'Gold', 300582),
	('Christian Janco', 'Silver', 14642);
    
INSERT INTO Flight (AircraftID, FlightNumber, Mileage) VALUES
	(1, 'DL143', 135),
	(2, 'DL122', 4370),
	(3, 'DL53', 2078),
	(3, 'DL222', 1765),
	(1, 'DL37', 531);
    
INSERT INTO FlightBooking (CustomerID, FlightID) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(1, 1),
	(3, 2),
	(3, 3),
	(1, 1),
	(4, 1),
	(1, 1),
	(3, 4),
	(5, 1),
	(4, 1),
	(6, 4),
	(7, 4),
	(5, 2),
	(4, 5),
	(8, 4);
