DROP SCHEMA IF EXISTS labSix;
CREATE SCHEMA labSix;
USE labSix;
CREATE TABLE authors (
	Id INT AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(255) NOT NULL
);
CREATE TABLE blog (
	author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    FOREIGN KEY (author_id) REFERENCES authors(Id)
);
INSERT INTO authors (author_name) values
	('Maria Charlotte'),
	('Juan Perez'),
	('Gemma Alcocer');
INSERT INTO blog (author_id, title, word_count, views) VALUES
    (1, 'Best Paint Colors', 814, 14),
    (2, 'Small Space Decorating Tips', 1146, 221),
    (1, 'Hot Accessories', 986, 105),
    (1, 'Mixing Textures', 765, 22),
    (2, 'Kitchen Refresh', 1242, 307),
    (1, 'Homemade Art Hacks', 1002, 193),
    (3, 'Refinishing Wood Floors', 1571, 7542);
   CREATE TABLE customers (
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(255) NOT NULL,
    Status VARCHAR(255),
    Total_Flight_Mileage INT
);
CREATE TABLE airline (
	Customer_Id INT,
	Flight_Number VARCHAR(255),
	Aircraft VARCHAR(255),
	Total_Aircraft_Seats INT,
	Flight_Mileage INT,
	FOREIGN KEY (Customer_Id) REFERENCES Customers(Id)
	);
INSERT INTO customers (Name, Status,  Total_Flight_Mileage)
VALUES
    ('Agustine Riviera', 'Silver',115235),
    ('Alaina Sepulvida', 'None',6008),
    ('Tom Jones', 'Gold',205767),
    ('Sam Rio', 'None',2653),
    ('Jessica James', 'Silver',127656),
    ('Ana Janco', 'Silver',136773),
    ('Jennifer Cortez', 'Gold',300582),
    ('Christian Janco', 'Silver',14642);
   INSERT INTO airline (Customer_Id, Flight_Number, Aircraft, Total_Aircraft_Seats,Flight_Mileage) VALUES
    (1, 'DL143','Boeing 747', 400, 135),
    (1, 'DL122','Airbus A330', 236, 4370),
    (2, 'DL122','Airbus A330', 236, 4370),
    (3, 'DL122','Airbus A330', 236, 4370),
    (3, 'DL53','Boeing 777', 264, 2078),
    (4, 'DL143','Boeing 747', 400, 135),
    (3, 'DL222','Boeing 777', 264, 1765),
    (5, 'DL143','Boeing 747', 400, 135),
    (4, 'DL37','Boeing 747', 400, 531),
    (6, 'DL222','Boeing 777', 264, 1765),
    (7, 'DL222','Boeing 777', 264, 1765),
    (5, 'DL122','Airbus A330', 236, 4370),
    (4, 'DL143','Boeing 747', 400, 135),
    (8, 'DL222','Boeing 777', 264, 1765);
   SELECT count(Flight_Number) AS total_flight_numbers FROM airline;
  SELECT AVG(Total_Aircraft_Seats) AS average_number_of_seats FROM airline;
 SELECT Status, AVG(Total_Flight_Mileage) AS average_flight_distance FROM customers GROUP BY Status;
SELECT Status, Max(Total_Flight_Mileage) AS max_number_of_miles_flown_by_status FROM customers GROUP BY Status;
SELECT COUNT(*) AS total_boeing_aircraft;
SELECT COUNT(*) AS flights_between_threeHundred_and_twoThousand FROM airline WHERE distance >= 300 AND distance <= 2000;
SELECT c.Status, AVG(a.Flight_Mileage) AS average_flight_distance_booked_by_status FROM customers c JOIN airline a ON c.Id = a.Customer_Id GROUP BY c.Status;