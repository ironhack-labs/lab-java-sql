USE lab_sql;

/* get the total number of flights in the database */
SELECT COUNT(*) FROM customers_flights;

/* get the average flight distance */
SELECT AVG(flight_mileage) FROM flights;

/* get the average number of seats */
SELECT AVG(total_aircraft_seats) FROM aircrafts;

/* get the average number of miles flown by customers grouped by status */
SELECT customer_status, AVG(total_customer_mileage) FROM customers GROUP BY customer_status;

/* get the maximum number of miles flown by customers grouped by status */
SELECT customer_status, MAX(total_customer_mileage) FROM customers GROUP BY customer_status;

/* get the total number of aircraft with a name containing Boeing */
SELECT COUNT(*) FROM aircrafts WHERE aircraft LIKE "%Boeing%";

/* find all flights with a distance between 300 and 2000 miles */
SELECT flight_number, flight_mileage FROM flights WHERE flight_mileage BETWEEN 300 AND 2000;

/* find the average flight distance booked grouped by customer status (this should require a join) */
SELECT customer_status, AVG(flight_mileage) FROM customers
INNER JOIN customers_flights ON customers.id = customers_flights.customer_id
INNER JOIN flights ON customers_flights.flight_id = flights.id
GROUP BY customer_status;

/* find the most often booked aircraft by gold status members (this should require a join) */
SELECT aircraft AS bookings FROM aircrafts
INNER JOIN flights ON aircrafts.id = flights.aircraft_id
INNER JOIN customers_flights ON flights.id = customers_flights.flight_id
INNER JOIN customers ON customers_flights.customer_id = customers.id
WHERE customer_status = "Gold"
GROUP BY aircraft
ORDER BY bookings DESC
LIMIT 1;
