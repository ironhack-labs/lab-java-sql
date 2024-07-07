

# 3. Total Flights
select count(flights.flight_number) as total_flights from flights;

# 4. Average Flight Distance
select avg(flights.mileage) as average_distance from flights;

# 5. Average Number of Seats
select avg(flights.seats) as average_seats from flights;

# 6. Average Miles by Customer
select status, avg(customers.mileage) as average_mile_per_customer from customers group by status;

# 7. Maximum Miles by Customer
select status, max(customers.mileage) as max_mile_per_customer from customers group by status;


# 8. Flights containing Boeing
select count(flights.flight_number) as Boeing_Flights from flights where aircraft like '%Boeing%';

# 9. Distance btn 300 - 2000
select * from flights where mileage between 300 and 2000;

# 10. Average distance by customer status
select status, avg(flights.mileage) as average_distance from customers join customer_flight on customers.customer_id = customer_flight.customer_id join flights on flights.flight_id = customer_flight.flight_id group by status;

# 11. Gold status most booked flight
select flight_number, status, count(flight_number) as flights from customers join customer_flight on customers.customer_id = customer_flight.customer_id join flights on flights.flight_id = customer_flight.flight_id where status = 'Gold' group by flight_number order by flights desc ;





