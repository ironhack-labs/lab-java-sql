CREATE DATABASE IF NOT EXISTS airline_db;
USE airline_db;

-- Create customers table
CREATE TABLE IF NOT EXISTS Customers(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
customer_name VARCHAR(255) NOT NULL,
customer_status VARCHAR(255),
customer_mileage INT
);

-- Create flight table
CREATE TABLE IF NOT EXISTS Flights(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
aircraft_number VARCHAR(10),
aircraft_name VARCHAR(50),
aircraft_seats INT,
aircraft_mileage INT
);

-- Create aircraft table
CREATE TABLE IF NOT EXISTS Aircrafts(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
customer INT,
flight INT,
FOREIGN KEY (customer) REFERENCES Customers(id),
FOREIGN KEY (flight) REFERENCES Flights(id)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_name, customer_status, customer_mileage) 
VALUES 
    ('Agustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', 'None', 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', 'None', 2653),
    ('Jessica James', 'Silver', 127656),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Jessica James', 'Silver', 127656),
    ('Christian Janco', 'Silver', 14642);

-- Insert data into Flights table
INSERT INTO Flights (aircraft_number, aircraft_name, aircraft_seats, aircraft_mileage)
VALUES 
    ('DL143', 'Boeing 747', 400, 135),
    ('DL122', 'Airbus A330', 236, 4370),
    ('DL53', 'Boeing 777', 264, 2078),
    ('DL222', 'Boeing 777', 264, 1765),
    ('DL37', 'Boeing 747', 400, 531);

-- Insert data into Airline table
INSERT INTO Aircrafts (customer, flight)
VALUES 
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
    (8, 2),
    (4, 5),
    (9, 4);