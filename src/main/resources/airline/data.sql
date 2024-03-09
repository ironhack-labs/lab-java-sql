INSERT INTO customer (name, status, total_mileage) VALUES
('Alaina Sepulvida', 'None', 6008),
('Agustine Riviera', 'Silver', 115235),
('Tom Jones', 'Gold', 205767),
('Sam Rio	None', 'DL143', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO aircraft (model, seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO flight (number, aircraft_id, mileage) VALUES
('DL143', 1, 135),
('DL122', 2, 4370),
('DL53', 3, 2078),
('DL222', 3, 1765),
('DL37', 1, 531);

INSERT INTO ticket (customer_id, flight_id, aircraft_id) VALUES
(2, 1, 1),
(2, 2, 2),
(1, 2, 2),
(2, 1, 1),
(3, 2, 2),
(3, 3, 3),
(2, 1, 1),
(4, 1, 1),
(2, 1, 1),
(3, 4, 3),
(5, 1, 1),
(4, 1, 1),
(6, 4, 3),
(7, 4, 3),
(5, 2, 2),
(4, 5, 1),
(8, 4, 3);

SELECT COUNT(*) FROM flight;
SELECT AVG(mileage) FROM flight;
SELECT AVG(seats) FROM aircraft;
SELECT status, AVG(mileage) FROM customer GROUP BY status;
SELECT status, MAX(mileage) FROM customer GROUP BY status;
SELECT COUNT(*) FROM aircraft WHERE model LIKE '%Boeing%';
SELECT * FROM flight WHERE mileage BETWEEN 300 AND 2000;

SELECT customer.status, avg(mileage) FROM ticket
inner join aircraft on ticket.aircraft_id = aircraft.id
inner join flight on ticket.flight_id = flight.id
inner join customer on ticket.customer_id = customer.id group by customer.status;

SELECT aircraft.model, COUNT(ticket.id) AS total_gold_bookings
FROM ticket
JOIN customer ON ticket.customer_id = customer.id
JOIN aircraft ON ticket.aircraft_id = aircraft.id
WHERE customer.status = 'Gold'
GROUP BY aircraft.model
ORDER BY total_bookings DESC
LIMIT 1;







