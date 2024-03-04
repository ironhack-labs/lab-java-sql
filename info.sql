USE lab_sql;

INSERT INTO authors (id, author) VALUES 
(1, 'Maria Charlotte'),
(2, 'Juan Perez'),
(3, 'Gemma Alcocer');

INSERT INTO posts (id, title, word_count, views, author_id) VALUES
(1, 'Best Paint Colors', 814, 14, 1),
(2, 'Small Space Decorating Tips', 1146, 221, 2),
(3, 'Hot Accessories', 986, 105, 1),
(4, 'Mixing Textures', 765, 22, 1),
(5, 'Kitchen Refresh', 1242, 307, 2),
(6, 'Homemade Art Hacks', 1002, 193, 1),
(7, 'Refinishing Wood Floors', 1571, 7542, 3);

INSERT INTO aircrafts (id, aircraft, total_aircraft_seats) VALUES
(1, 'Airbus A330', '236'),
(2, 'Boeing 747', '400'),
(3, 'Boeing 777', '400');

INSERT INTO flights (id, flight_number, flight_mileage, aircraft_id) VALUES
(1, 'DL37', '531', 2),
(2, 'DL53', '2078', 3),
(3, 'DL122', '4370', 1),
(4, 'DL143', '135', 2),
(5, 'DL222', '1765', 3);

INSERT INTO customers (id, customer_name, customer_status, total_customer_mileage) VALUES
(1, 'Agustine Riviera', 'Silver', 115235),
(2, 'Alaina Sepulvida', 'None', 6008),
(3, 'Ana Janco', 'Silver', 136773),
(4, 'Christian Janco', 'Silver', 14642),
(5, 'Jennifer Cortez', 'Gold', 300582),
(6, 'Jessica James', 'Silver', 127656),
(7, 'Sam Rio', 'None', 2653),
(8, 'Tom Jones', 'Gold', 205767);

INSERT INTO customers_flights (customer_id, flight_id) VALUES
(1, 4),
(1, 3),
(1, 4),
(1, 4),
(1, 4),
(2, 3),
(3, 5),
(4, 5),
(5, 5),
(6, 4),
(6, 3),
(7, 4),
(7, 4),
(7, 1),
(8, 3),
(8, 2),
(8, 5);
