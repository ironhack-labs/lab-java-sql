-- Select the "Airline" database
USE airline_lab;

-- Get the total number of flights in the database
SELECT id_flight, COUNT(*) FROM flight GROUP BY id_flight;

-- Get the average flight distance.
SELECT AVG(flight_mileage) AS avg_mileage FROM flight;

-- Get the average number of seats.
SELECT AVG(seats) AS avg_seats FROM flight;

-- Get the average number of miles flown by customers grouped by status.
SELECT status, AVG(customer_mileage) FROM customer GROUP BY status;

-- Get the maximum number of miles flown by customers grouped by status.
SELECT status, MAX(customer_mileage) FROM customer GROUP BY status;

-- Get the total number of aircraft with a name containing Boeing.
SELECT * FROM flight WHERE aircraft_name LIKE 'Boeing%';

-- Find all flights with a distance between 300 and 2000 miles.
SELECT * FROM flight WHERE flight_mileage >= 300 AND flight_mileage <= 2000;

-- Find the average flight distance booked grouped by customer status (this should require a join).
SELECT customer.status, AVG(flight.flight_mileage) FROM customer 
INNER JOIN airline ON airline.id_customer = airline.id_customer
INNER JOIN flight ON airline.id_flight = flight.id_flight
GROUP BY customer.status;

-- Find the most often booked aircraft by gold status members (this should require a join).
SELECT flight.aircraft_name, COUNT(airline.id_flight) AS bookings FROM airline
INNER JOIN flight ON airline.id_flight = flight.id_flight
INNER JOIN customer ON airline.id_customer = customer.id_customer
WHERE customer.status = 'gold'
GROUP BY flight.aircraft_name
ORDER BY bookings DESC
LIMIT 1;
