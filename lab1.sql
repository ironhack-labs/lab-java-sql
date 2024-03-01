CREATE DATABASE lab_sql;
USE lab_sql;

CREATE TABLE authors (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE posts (
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    author INT,
    words INT,
    views INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author) REFERENCES authors(id)
);

INSERT INTO authors (name) VALUES
	('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');
    

INSERT INTO posts (title, author, words, views) VALUES
	('Best Paint Colors', 1, 814, 14),
    ('Small Space Decorating Tips', 2, 1146, 221),
    ('Hot Accessories', 1, 986, 105),
    ('Mixing Textures', 1, 765, 22),
    ('Kitchen Refresf', 2, 1242, 307),
    ('Hommade Art Hacks', 1, 1002, 193),
    ('Refreshing Wood Floors', 3, 1571, 7542);
    
SELECT title, author FROM posts
JOIN authors ON  posts.author =  authors.id;

CREATE TABLE customers (
	id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255),
    status VARCHAR(255),
    total_customer_mileage INT,
    PRIMARY KEY (id)
);

INSERT INTO customers (customer_name, status, total_customer_mileage) VALUES
	('Agustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', NULL, 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', NULL, 2653),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Jessica James', 'Silver', 127656),
    ('Christian Janco', 'Silver', 14642);
    
    

CREATE TABLE aircrafts (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    total_seats INT,
    PRIMARY KEY (id)
);

INSERT INTO aircrafts (name, total_seats) VALUES
	('Boeing 747', 400),
    ('Airbus A330', 236),
    ('Boeing 777', 264);
    
   
CREATE TABLE flights (
	flight_id INT NOT NULL AUTO_INCREMENT,
    flight_number VARCHAR(255),
    aircraft_id INT,
    aircraft_name VARCHAR(255),
    flight_mileage INT,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);

INSERT INTO flights (flight_number, aircraft_id, aircraft_name, flight_mileage) VALUES
	('DL143', 1, 'Boeing 747', 135),
    ('DL122', 2, 'Airbus A330', 4370),
    ('DL53', 3, 'Boeing 777', 2078),
    ('DL222', 3, 'Boeing 777', 1765),
    ('DL37', 1, 'Boeing 747', 531);

CREATE TABLE customer_flights (
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT,
    flight_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
    );

INSERT INTO customer_flights (customer_id, flight_id) VALUES
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
    (7, 1),
    (4, 1),
    (5, 4),
    (6, 4),
    (7, 2),
    (4, 5),
    (8, 4);
    
SELECT COUNT(*) FROM flights;
SELECT AVG(flight_mileage) FROM flights;
SELECT AVG(total_seats) FROM aircrafts;
SELECT status, AVG(total_customer_mileage) FROM customers GROUP BY status;
SELECT status, MAX(total_customer_mileage) FROM customers GROUP BY status;
SELECT COUNT(*) FROM aircrafts WHERE name LIKE '%Boeing%';
SELECT flight_number FROM flights WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT AVG(flight_mileage), status
FROM customer_flights AS cf
JOIN customers AS c ON cf.customer_id = c.id
JOIN flights AS f ON cf.flight_id = f.flight_id
GROUP BY c.status;

SELECT status, aircraft_name, COUNT(aircraft_name) AS aircraft_count
FROM customer_flights AS cf
JOIN customers AS c ON cf.customer_id = c.id
JOIN flights AS f ON cf.flight_id = f.flight_id
WHERE c.status = 'Gold'
GROUP BY c.status, aircraft_name
ORDER BY aircraft_count DESC
LIMIT 1;

    
    