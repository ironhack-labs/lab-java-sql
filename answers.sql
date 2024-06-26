--Question 1
CREATE TABLE Authors(
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) NOT FULL
):

CREATE TABLE BlogPosts(
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO BlogPosts (author_id, title, word_count, views) VALUES
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Best Paint Colors', 814, 14),
((SELECT author_id FROM Authors WHERE author_name = 'Juan Perez'), 'Small Space Decorating Tips', 1146, 221),
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Hot Accessories', 986, 105),
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Mixing Textures', 765, 22),
((SELECT author_id FROM Authors WHERE author_name = 'Juan Perez'), 'Kitchen Refresh', 1242, 307),
((SELECT author_id FROM Authors WHERE author_name = 'Maria Charlotte'), 'Homemade Art Hacks', 1002, 193),
((SELECT author_id FROM Authors WHERE author_name = 'Gemma Alcocer'), 'Refinishing Wood Floors', 1571, 7542);

--Question 2

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50),
    total_mileage INT
);

CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_type VARCHAR(50) NOT NULL,
    total_seats INT NOT NULL
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(50) NOT NULL,
    aircraft_id INT,
    flight_mileage INT NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE CustomerFlights (
    customer_flight_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Aircraft (aircraft_type, total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO Customers (customer_name, customer_status, total_mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO Flights (flight_number, aircraft_id, flight_mileage) VALUES
('DL143', (SELECT aircraft_id FROM Aircraft WHERE aircraft_type = 'Boeing 747'), 135),
('DL122', (SELECT aircraft_id FROM Aircraft WHERE aircraft_type = 'Airbus A330'), 4370),
('DL53', (SELECT aircraft_id FROM Aircraft WHERE aircraft_type = 'Boeing 777'), 2078),
('DL222', (SELECT aircraft_id FROM Aircraft WHERE aircraft_type = 'Boeing 777'), 1765),
('DL37', (SELECT aircraft_id FROM Aircraft WHERE aircraft_type = 'Boeing 747'), 531);

INSERT INTO CustomerFlights (customer_id, flight_id) VALUES
((SELECT customer_id FROM Customers WHERE customer_name = 'Agustine Riviera'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Agustine Riviera'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Alaina Sepulvida'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Tom Jones'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Tom Jones'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL53')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Tom Jones'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL222')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Sam Rio'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Sam Rio'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL37')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Jessica James'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Jessica James'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Ana Janco'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL222')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Jennifer Cortez'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL222')),
((SELECT customer_id FROM Customers WHERE customer_name = 'Christian Janco'), (SELECT flight_id FROM Flights WHERE flight_number = 'DL222'));

--Question 3
SELECT COUNT(*) AS total_flights FROM Flights;
--Question 4
SELECT AVG(flight_mileage) AS average_flight_distance FROM Flights;
--Question 5
SELECT AVG(total_seats) AS average_seats FROM Aircraft;
--Question 6
SELECT customer_status, AVG(total_mileage) AS average_miles_flown
FROM Customers
GROUP BY customer_status;
--Question 7
SELECT customer_status, MAX(total_mileage) AS max_miles_flown
FROM Customers
GROUP BY customer_status;
--Question 8
SELECT COUNT(*) AS total_boeing_aircraft
FROM Aircraft
WHERE aircraft_type LIKE '%Boeing%';
--Question 9
SELECT *
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;
--Question 10
SELECT c.customer_status, AVG(f.flight_mileage) AS average_flight_distance
FROM CustomerFlights cf
JOIN Customers c ON cf.customer_id = c.customer_id
JOIN Flights f ON cf.flight_id = f.flight_id
GROUP BY c.customer_status;
--Question 11
SELECT a.aircraft_type, COUNT(*) AS booking_count
FROM CustomerFlights cf
JOIN Customers c ON cf.customer_id = c.customer_id
JOIN Flights f ON cf.flight_id = f.flight_id
JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_type
ORDER BY booking_count DESC
LIMIT 1;
