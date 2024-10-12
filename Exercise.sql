CREATE DATABASE blog_db;

USE blog_db;

CREATE TABLE blog (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      author VARCHAR (50),
                      title VARCHAR (100),
                      word_count INT(50),
                      views INT (100)
);

INSERT INTO blog (id, author, title, word_count, views)
VALUES
    ('1', 'Maria Charlotte', 'Best Paint Colors', '814', '14'),
    ('2', 'Juan Perez','Small Space Decoration Tips', '1146', '221'),
    ('3','Maria Charlotte', 'Hot Accessories', '986', '105'),
    ('4', 'Maria Charlotte', 'Mixing Textures', '765', '22'),
    ('5', 'Juan Perez', 'Kitchen Refresh', '1242', '307'),
    ('6','Maria Charlotte','Homemade Art Hacks', '1002', '193'),
    ('7', 'Gemma Alcocer', 'Refinishing Wood Floor', '1571','7542');


CREATE database customers_db;

USE customers_db;

CREATE TABLE customers (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           Name VARCHAR (50),
                           Status VARCHAR (20),
                           Mileage INT (100)
);

SELECT * From customers;

INSERT INTO customers (id, Name, Status, Mileage)
VALUES ('1', 'Augustine Riviera', ' Silver', '115235'),
       ('2', 'Alaina Sepulvida', 'null', '6008'),
       ('3', 'Tom Jones', 'Gold', '205767'),
       ('4', 'Jessica James', 'Silver', '127656'),
       ('5', 'Sam Rio', 'null', '2653'),
       ('6', 'Ana Janco', 'Silver', '136773'),
       ('7', 'Jennifer Cortez', 'Gold', '300582'),
       ('8', 'Christian Janco', 'Silver', '14642');

CREATE database flights_db;

USE flights_db;

CREATE TABLE flights (
                         flight_number VARCHAR(10),
                         aircraft VARCHAR (50),
                         seats INT (100),
                         mileage INT (100),
                         flight_id INT AUTO_INCREMENT,
                         FOREIGN KEY (flight_id) REFERENCES customers (id)

);

-- In the Airline database write the SQL script to get the total number of flights in the database
SELECT flight_number, COUNT(*) FROM flights;

-- In the Airline database write the SQL script to get the average flight distance.
SELECT mileage, AVG(mileage) FROM flights;

-- In the Airline database write the SQL script to get the average number of seats.
SELECT seats, AVG(seats) FROM flights;

-- In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT Name, mileage, AVG(Mileage)
FROM customers
GROUP BY Status;

-- In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT Name, mileage, MAX(mileage)
FROM customers
GROUP BY Status;

-- In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT aircraft
FROM flights
WHERE aircraft='Boeing';

-- In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT *
FROM flights
WHERE mileage
          BETWEEN 300 AND 2000;

-- In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT flights.mileage, AVG(score)
FROM flights
         JOIN customers
              ON flights.flight_id = customers.id
GROUP BY Status;

-- In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
