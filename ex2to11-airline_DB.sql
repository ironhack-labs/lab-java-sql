CREATE TABLE Customer(
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(255) NOT NULL,
customer_status VARCHAR(255),
total_mileage INT
);

CREATE TABLE Aircraft(
aircraft_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
aircraft_name VARCHAR(255) NOT NULL,
aircraft_seats INT NOT NULL
);

CREATE TABLE Flight(
flight_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
flight_number VARCHAR(255) NOT NULL,
aircraft_id INT NOT NULL,
	FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id),
flight_mileage INT NOT NULL
);

CREATE TABLE Bookings(
booking_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
flight_id INT NOT NULL
);

INSERT INTO Aircraft (aircraft_name,aircraft_seats) VALUES
("Boeing 747",400),
("Airbus A330",236),
("Boeing 777",264);

INSERT INTO Flight (flight_number,aircraft_id,flight_mileage) VALUES
("DL143",1,135),
("DL122",2,4370),
("DL53",3,2078),
("DL222",3,1765),
("DL37",1,531);

INSERT INTO Customer (customer_name,customer_status,total_mileage) VALUES
("Agustine Riviera","Silver",115235),
("Alaina Sepulvida",Null,6008),
("Tom Jones","Gold",205767),
("Sam Rio",Null,2653),
("Jessica James","Silver",127656),
("Ana Janco","Silver",136773),
("Jennifer Cortez","Gold",300582),
("Christian Janco","Silver",14642);

INSERT INTO Bookings (customer_id,flight_id) VALUES
(1,1),
(1,2),
(2,2),
(1,1),
(3,2),
(3,3),
(1,1),
(4,1),
(1,1),
(3,4),
(5,1),
(4,1),
(6,4),
(7,4),
(5,4),
(4,5),
(8,4);

/* 3. Total number of flights*/
SELECT COUNT(*) AS TotalNumFlights
FROM Flight;

/* 4. Average flight distance*/
SELECT AVG(flight_mileage) AS AverageFlightDistance
 FROM Flight;

/* 5. Average number of seats*/
SELECT AVG(aircraft_seats) AS AverageNumSeats
FROM Aircraft;

/* 6. Average number of miles flown by customer grouped by status*/
SELECT customer_status AS Status, AVG(total_mileage) AS AverageNumberOfMiles
FROM Customer GROUP BY (customer_status);

/* 7. Max number of miles flown by customer grouped by status*/
SELECT customer_status AS Status, MAX(total_mileage) AS MaxNumberOfMiles
FROM Customer GROUP BY (customer_status);

/* 8. Total number of aircraft with a name containing Boeing*/
SELECT COUNT(*) AS AircraftsBoeing
FROM Aircraft WHERE aircraft_name LIKE "%Boeing%";

/* 9. Flights with distance between 300 and 2000 miles*/
SELECT * FROM Flight WHERE flight_mileage BETWEEN 300 AND 2000;

/* 10. Average flight distance booked grouped by customer status*/
SELECT customer_status AS Status, AVG(flight_mileage) AS AverageFlightDistance
FROM Bookings
INNER JOIN Customer ON Bookings.customer_id = Customer.customer_id
INNER JOIN Flight ON Bookings.flight_id = Flight.flight_id
GROUP BY customer_status;

/* 11. Most often booked aircraft by gold status members*/
SELECT aircraft_name AS MostOftenBookedAircraftByGoldMembers, COUNT(aircraft_name) AS BookingsCount
FROM Bookings
INNER JOIN Customer ON Bookings.customer_id = Customer.customer_id
INNER JOIN Flight ON Bookings.flight_id = Flight.flight_id
INNER JOIN Aircraft ON Flight.aircraft_id = Aircraft.aircraft_id
WHERE customer_status="Gold"
GROUP BY aircraft_name
ORDER BY BookingsCount DESC
LIMIT 1;