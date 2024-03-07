CREATE TABLE Authors(
 id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(255) NOT NULL,
 PRIMARY KEY(id)
);

CREATE TABLE Posts (
	id int NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id int NOT NULL,
    word_count int NOT NULL,
    views int NOT NULL,
	PRIMARY KEY(id),
    FOREIGN KEY (author_id) REFERENCES Author(ID)
 );

CREATE TABLE Customers (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	status VARCHAR(10) NOT NULL,
	total_customer_mileage INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Aircrafts (
	id int NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	total_aircraft_seats INT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Flights (
	flight_number INT NOT NULL,
	flight_mileage INT NOT NULL,
    aircraft_id INT NOT NULL,
	PRIMARY KEY(flight_number),
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(id)
);

CREATE TABLE Tickets (
	id int NOT NULL AUTO_INCREMENT,
    flight_number int NOT NULL,
    customer_id int NOT NULL,
    PRIMARY KEY(id),
	FOREIGN KEY (flight_number) REFERENCES Flights(flight_number),
	FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

SELECT COUNT(*) FROM Flights;
SELECT AVG(flight_mileage) FROM Flights;
SELECT AVG(total_aircraft_seats) FROM Aircrafts;
SELECT status, MAX(total_customer_mileage) FROM Customers GROUP BY status;
SELECT COUNT(*) FROM Aircrafts WHERE name LIKE '%Boeing%';
SELECT flight_number FROM Flights WHERE flight_mileage BETWEEN 300 AND 2000;
SELECT status, AVG(flight_mileage)
FROM Tickets LEFT JOIN Customers ON Tickets.customer_id = Customers.id LEFT JOIN Flights ON Tickets.flight_number = Flights.flight_number
GROUP BY status;
SELECT aircraft_id, COUNT(*) AS bookings
FROM Tickets LEFT JOIN Customers ON Tickets.customer_id = Customers.id LEFT JOIN Flights ON Tickets.flight_number = Flights.aircraft_id
WHERE status = 'Gold'
GROUP BY aircraft_id
ORDER BY bookings DESC
LIMIT 1;