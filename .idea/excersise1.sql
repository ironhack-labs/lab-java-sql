#In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*)FROM flight;
#In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight.flight_mileage)FROM flight;
#In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(aircraft.total_seats)from aircraft;
#In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT AVG(customer.customer_mileage)AS average_miles_flown FROM customer GROUP BY customer_status;
#In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT MAX(customer.customer_mileage)FROM customer GROUP BY customer_status;
#In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*)AS total_boeing_aircraft FROM aircraft WHERE aircraft.aircraft_name LIKE '%Boeing%';
#In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT flight.flight_mileage FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;
#In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT customer_status, AVG(f.flight_mileage) AS average_flight_distance
FROM flight cf
         JOIN flight f ON cf.flight_number = f.flight_number
         JOIN customer c ON customer_ID = c.customer_id
GROUP BY customer_status;
#In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT COUNT(aircraft.aircraft_name)AS booking_count
FROM aircraft JOIN customer ON aircraft_name
WHERE customer_status = 3
GROUP BY aircraft_name
LIMIT 1
