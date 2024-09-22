#Script to test datas for airline database
USE airline;

# In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*) AS 'flight total number'
FROM flight;
#In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(mileage_flight) AS 'average flight distance'
FROM flight;
#In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(aircraft_seat) AS 'average seat number'
FROM aircrafts;
#In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT c.status, AVG(fc.customer_mileage)
FROM flight_customer fc
		 JOIN customer c ON fc.customer = c.id
GROUP BY c.status;
#In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT c.status, MAX(fc.customer_mileage)
FROM flight_customer fc
		 JOIN customer c ON fc.customer = c.id
GROUP BY c.status;
#In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing
SELECT *
FROM aircrafts a
WHERE a.name LIKE '%Boeing%';
#In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT *
FROM flight
WHERE mileage_flight BETWEEN 300 AND 2000;
#In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT c.status, AVG(mileage_flight)
FROM flight f
		 JOIN airline.flight_customer fc ON f.id = fc.flight
		 JOIN customer c ON c.id = fc.customer
GROUP BY c.status;
#In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT a.name, COUNT(*) AS 'top gold booked flight '
FROM customer c
		 JOIN airline.flight_customer fc ON c.id = fc.customer
		 JOIN flight f  ON fc.flight = f.id
		 JOIN aircrafts a ON f.aircraft = a.id
		 JOIN status_customer  sc ON c.status = sc.id
WHERE sc.status = 'GOLD'
GROUP BY a.name
LIMIT 1;

#more tests for training
SELECT c.status , COUNT(*)
FROM customer c
GROUP BY status;

SELECT *
FROM flight;

SELECT COUNT(*)
FROM flight;

SELECT MIN(mileage_flight)
FROM flight;

SELECT MAX(mileage_flight)
FROM flight;

SELECT AVG(flight.mileage_flight) FROM flight;

SELECT SUM(flight.mileage_flight) FROM flight;

SELECT SUM(flight.mileage_flight)
FROM flight
GROUP BY flight.aircraft;

SELECT * FROM flight
WHERE name IN ('DL143','DL122');

SELECT * FROM flight
WHERE name LIKE '%2';

SELECT * FROM flight
WHERE name LIKE '%L%';

SELECT *
FROM aircrafts
WHERE aircraft_seat BETWEEN 200 AND 300;

SELECT * FROM aircrafts
ORDER BY aircraft_seat DESC ;