-- Create the Customer table (if it doesn't exist)
CREATE TABLE IF NOT EXISTS customer (
    id_customer INT AUTO_INCREMENT,
    name VARCHAR(100),
    status VARCHAR(50),
    customer_mileage INT,
    PRIMARY KEY (id_customer)
);

-- Create the Flight (if it doesn't exist)
CREATE TABLE IF NOT EXISTS flight (
    id_flight INT AUTO_INCREMENT,
    number VARCHAR(10),
    aircraft_name VARCHAR(50),
    seats INT,
    flight_mileage INT,
    PRIMARY KEY (id_flight)
);

-- Create the Airline table (if it doesn't exist)
CREATE TABLE IF NOT EXISTS airline (
    id_movements INT AUTO_INCREMENT,
    id_customer INT,
    id_flight INT,
	PRIMARY KEY (id_movements),
	FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
	FOREIGN KEY (id_flight) REFERENCES flight(id_flight)
);

-- Insert data into the Customer table
INSERT INTO customer (name, status, customer_mileage) 
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

-- Insert data into the Flight table
INSERT INTO flight (number, aircraft_name, seats, flight_mileage)
VALUES 
    ('DL143', 'Boeing 747', 400, 135),
    ('DL122', 'Airbus A330', 236, 4370),
    ('DL53', 'Boeing 777', 264, 2078),
    ('DL222', 'Boeing 777', 264, 1765),
    ('DL37', 'Boeing 747', 400, 531);
    
-- Insert data into the Airline table
INSERT INTO airline (id_customer, id_flight)
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
    
-- All operations completed successfully