//The full table after removing the duplicates
| Customer Name    |	| Customer Status |	| Flight Number |	| Aircraft    |	| Total Aircraft Seats |	| Flight Mileage |	| Total Customer Mileage |
| ---------------- |	| --------------- |	| ------------- |	| ----------- |	| -------------------- |	| -------------- |	| ---------------------- |
| Agustine Riviera |	| Silver          |	| DL122         |	| Airbus A330 |	| 236                  |	| 4370           |	| 115235                 |
| Alaina Sepulvida |	| None            |	| DL122         |	| Airbus A330 |	| 236                  |	| 4370           |	| 6008                   |
| Tom Jones        |	| Gold            |	| DL122         |	| Airbus A330 |	| 236                  |	| 4370           |	| 205767                 |
| Jessica James    |	| Silver          |	| DL122         |	| Airbus A330 |	| 236                  |	| 4370           |	| 127656                 |
| Sam Rio          |	| None            |	| DL143         |	| Boeing 747  |	| 400                  |	| 135            |	| 2653                   |
| Agustine Riviera |	| Silver          |	| DL143         |	| Boeing 747  |	| 400                  |	| 135            |	| 115235                 |
| Jessica James    |	| Silver          |	| DL143         |	| Boeing 747  |	| 400                  |	| 135            |	| 127656                 |
| Tom Jones        |	| Gold            |	| DL222         |	| Boeing 777  |	| 264                  |	| 1765           |	| 205767                 |
| Ana Janco        |	| Silver          |	| DL222         |	| Boeing 777  |	| 264                  |	| 1765           |	| 136773                 |
| Jennifer Cortez  |	| Gold            |	| DL222         |	| Boeing 777  |	| 264                  |	| 1765           |	| 300582                 |
| Christian Janco  |	| Silver          |	| DL222         |	| Boeing 777  |	| 264                  |	| 1765           |	| 14642                  |
| Sam Rio          |	| None            |	| DL37          |	| Boeing 747  |	| 400                  |	| 531            |	| 2653                   |
| Tom Jones        |	| Gold            |	| DL53          |	| Boeing 777  |	| 264                  |	| 2078           |	| 205767                 |


-- After normalizing the table we got 3 groups, removing duplicates and grouping columns together

-- customers
customer_id	| Customer Name    |	| Customer Status |	| Total Customer Mileage |
-----------	| ---------------- |	| --------------- |	| ---------------------- |
1	        | Agustine Riviera |	| Silver          |	| 115235                 |
2	        | Alaina Sepulvida |	| None            |	| 6008                   |
3	        | Tom Jones        |	| Gold            |	| 205767                 |
4	        | Sam Rio          |	| None            |	| 2653                   |
5	        | Jessica James    |	| Silver          |	| 127656                 |
6	        | Ana Janco        |	| Silver          |	| 136773                 |
7	        | Jennifer Cortez  |	| Gold            |	| 300582                 |
8	        | Christian Janco  |	| Silver          |	| 14642                  |

-- flights
flight_id	| Flight Number |	| Flight Mileage |
----------- | ------------- |	| -------------- |
1	        | DL122         |	| 4370           |
2	        | DL143         |	| 135            |
3	        | DL222         |	| 1765           |
4	        | DL37          |	| 531            |
5	        | DL53          |	| 2078           |

-- planes
plane_id	| Aircraft    |	| Total Aircraft Seats |
----------- | ----------- |	| -------------------- |
1	        | Airbus A330 |	| 236                  |
2	        | Boeing 747  |	| 400                  |
3	        | Boeing 777  |	| 264                  |


CREATE DATABASE airplane;

USE airplane;

CREATE TABLE customers(
                          customer_id INT AUTO_INCREMENT PRIMARY KEY,
                          customer_name VARCHAR(20),
                          customer_status VARCHAR (10),
                          total_customer_mileage INT
);

CREATE TABLE planes(
                       plane_id INT AUTO_INCREMENT PRIMARY KEY,
                       aircraft VARCHAR(20),
                       total_aircraft_seats INT
);

CREATE TABLE flights(
                        flight_id INT AUTO_INCREMENT PRIMARY KEY,
                        flight_number VARCHAR(10),
                        flight_mileage INT,
                        customer_id INT,
                        plane_id INT,
                        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                        FOREIGN KEY (plane_id) REFERENCES planes(plane_id)
);



SELECT COUNT (*) FROM flights;
SELECT AVG flight_mileage FROM flights;
SELECT AVG total_aircraft_seats FROM planes;
SLECT AVG total_customer_mileage FROM customer GROUP BY customer_status;
SLECT MAX total_customer_mileage FROM customer GROUP BY customer_status;
SELECT COUNT aircraft FROM planes LIKE 'Boeing%';
SELECT flight_mileage FROM flights BETWEEN 300 and 2000;

SELECT c.customer_status, AVG(f.flight_mileage) AS average_flight_distance
FROM Customers c
JOIN Flights f ON c.customer_id = f.customer_id
GROUP BY c.customer_status;

SELECT a.aircraft_name, COUNT(*) AS bookings
FROM Flights f
JOIN Customers c ON f.customer_id = c.customer_id
JOIN Aircrafts a ON f.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY bookings DESC
LIMIT 1;





