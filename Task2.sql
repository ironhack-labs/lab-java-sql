CREATE DATABASE airline_db;
use airline_db;
CREATE TABLE customers (
                           CustomerID INTEGER PRIMARY KEY ,
                           Customer_name VARCHAR(200) NOT NULL ,
                           Customer_status VARCHAR(50) NOT NULL ,
                           Total_customer_mileage INTEGER NOT NULL
);
CREATE TABLE aircraft(
                         AirCraftID VARCHAR(25) PRIMARY KEY NOT NULL ,
                         Aircraft_name VARCHAR(200) NOT NULL ,
                         Total_seats INTEGER NOT NULL
);
CREATE TABLE flights (
                         Flight_number VARCHAR(50) PRIMARY KEY NOT NULL ,
                         AirCraftID VARCHAR(50) NOT NULL,
                         FOREIGN KEY (AirCraftID) REFERENCES aircraft(AirCraftID),
                         Flight_mileage INTEGER NOT NULL
);
CREATE TABLE CustomersFlights (
                                  CustomerID INTEGER NOT NULL ,
                                  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID) ,
                                  Flight_number VARCHAR(50) NOT NULL ,
                                  FOREIGN KEY (Flight_number) REFERENCES flights(Flight_number)
);
INSERT INTO customers (CustomerID, Customer_name, Customer_status, Total_customer_mileage)
VALUES
    (1, 'Agustine Riviera', 'Silver', 115235),
    (2, 'Alaina Sepulvida', 'None', 6008),
    (3, 'Tom Jones', 'Gold', 205767),
    (4, 'Sam Rio', 'None', 2653),
    (5, 'Jessica James', 'Silver', 127656),
    (6, 'Ana Janco', 'Silver', 136773),
    (7, 'Jennifer Cortez', 'Gold', 300582),
    (8, 'Christian Janco', 'Silver', 14642);
INSERT INTO aircraft (AirCraftID, Aircraft_name, Total_seats)
VALUES
    ('AC1', 'Boeing 747', 400),
    ('AC2', 'Airbus A330', 236),
    ('AC3', 'Boeing 777', 264);
INSERT INTO flights (Flight_number, AirCraftID, Flight_mileage)
VALUES
    ('DL122', (SELECT aircraft.AirCraftID FROM aircraft WHERE Aircraft_name = 'Airbus A330'), 4370),
    ('DL53', (SELECT aircraft.AirCraftID FROM aircraft WHERE Aircraft_name = 'Boeing 777'), 2078),
    ('DL143', (SELECT aircraft.AirCraftID FROM aircraft WHERE Aircraft_name = 'Boeing 747'), 135),
    ('DL222', (SELECT aircraft.AirCraftID FROM aircraft WHERE Aircraft_name = 'Boeing 777'), 1765),
    ('DL37', (SELECT aircraft.AirCraftID FROM aircraft WHERE Aircraft_name = 'Boeing 747'), 531);
INSERT INTO CustomersFlights (CustomerID, Flight_number)
VALUES
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Agustine Riviera'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 135)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Agustine Riviera'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 4370)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Alaina Sepulvida'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 4370)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Tom Jones'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 4370)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Tom Jones'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 2078)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Tom Jones'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 1765)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Sam Rio'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 135)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Sam Rio'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 531)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Jessica James'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 135)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Jessica James'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 4370)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Ana Janco'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 1765)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Jennifer Cortez'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 1765)),
    ((SELECT CustomerID FROM customers WHERE Customer_name = 'Christian Janco'), (SELECT Flight_number FROM flights WHERE Flight_mileage = 1765));

SELECT COUNT(*) AS total_flights FROM flights;

SELECT AVG(Flight_mileage) AS average_flight_distance FROM flights;

SELECT AVG(Total_seats) AS average_seats FROM aircraft;

SELECT Customer_status, AVG(Total_customer_mileage) AS average_mileage FROM customers GROUP BY Customer_status;

SELECT customers.Customer_status, MAX(customers.Total_customer_mileage) AS max_mileage FROM customers GROUP BY Customer_status;

SELECT COUNT(*) AS total_boeing_aircraft FROM aircraft WHERE aircraft.Aircraft_name LIKE '%Boeing%';

SELECT * FROM flights WHERE Flight_mileage BETWEEN 300 AND 2000;

SELECT c.Customer_status, AVG(f.Flight_mileage) AS average_flight_distance
FROM CustomersFlights b
         JOIN customers c on b.CustomerID = c.CustomerID
         JOIN flights f ON b.Flight_number = f.Flight_number
GROUP BY Customer_status;

SELECT a.Aircraft_name, COUNT(*) AS flights_count
FROM CustomersFlights b
         JOIN Customers c ON b.CustomerID = c.CustomerID
         JOIN Flights f ON b.Flight_number = f.Flight_number
         JOIN Aircraft a ON f.AirCraftID = a.AirCraftID
WHERE c.Customer_status = 'Gold'
GROUP BY a.Aircraft_name
ORDER BY flights_count DESC
    LIMIT 1;