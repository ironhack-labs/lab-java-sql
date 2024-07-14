
### Part 1: Normalize the Databases

#### Blog Database

Initial Schema:

author               title                         word count   views
--------------------------------------------------------------
Maria Charlotte      Best Paint Colors             814          14
Juan Perez           Small Space Decorating Tips   1146         221
Maria Charlotte      Hot Accessories               986          105
Maria Charlotte      Mixing Textures               765          22
Juan Perez           Kitchen Refresh               1242         307
Maria Charlotte      Homemade Art Hacks            1002         193
Gemma Alcocer        Refinishing Wood Floors       1571         7542


Normalization Process:

1. First Normal Form (1NF):
   - Ensure all columns have atomic values and each row is uniquely identifiable.
   - Already in 1NF as each column has atomic values.

2. Second Normal Form (2NF):
   - Ensure it is in 1NF and all non-key attributes are fully functional dependent on the primary key.
   - Identify the primary key: author and title.

3. Third Normal Form (3NF):
   - Ensure it is in 2NF and all attributes are only dependent on the primary key.
   - No transitive dependency.

Final Tables:

- Authors
  
  author_id  author_name
  -----------------------
  1          Maria Charlotte
  2          Juan Perez
  3          Gemma Alcocer
  

- Posts
  
  post_id  author_id  title                         word_count  views
  -------------------------------------------------------------------
  1        1          Best Paint Colors             814         14
  2        2          Small Space Decorating Tips   1146        221
  3        1          Hot Accessories               986         105
  4        1          Mixing Textures               765         22
  5        2          Kitchen Refresh               1242        307
  6        1          Homemade Art Hacks            1002        193
  7        3          Refinishing Wood Floors       1571        7542
  

DDL Scripts:
sql
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_id, author_name) VALUES 
(1, 'Maria Charlotte'),
(2, 'Juan Perez'),
(3, 'Gemma Alcocer');

INSERT INTO Posts (post_id, author_id, title, word_count, views) VALUES
(1, 1, 'Best Paint Colors', 814, 14),
(2, 2, 'Small Space Decorating Tips', 1146, 221),
(3, 1, 'Hot Accessories', 986, 105),
(4, 1, 'Mixing Textures', 765, 22),
(5, 2, 'Kitchen Refresh', 1242, 307),
(6, 1, 'Homemade Art Hacks', 1002, 193),
(7, 3, 'Refinishing Wood Floors', 1571, 7542);


#### Airline Database

Initial Schema:

Customer Name    Customer Status    Flight Number    Aircraft     Total Aircraft Seats    Flight Mileage    Total Customer Mileage
------------------------------------------------------------------------------------------------------------------------------
Agustine Riviera Silver             DL143            Boeing 747   400                    135               115235
Agustine Riviera Silver             DL122            Airbus A330  236                    4370              115235
Alaina Sepulvida  None              DL122            Airbus A330  236                    4370              6008
Agustine Riviera Silver             DL143            Boeing 747   400                    135               115235
Tom Jones        Gold               DL122            Airbus A330  236                    4370              205767
Tom Jones        Gold               DL53             Boeing 777   264                    2078              205767
Agustine Riviera Silver             DL143            Boeing 747   400                    135               115235
Sam Rio          None               DL143            Boeing 747   400                    135               2653
Agustine Riviera Silver             DL143            Boeing 747   400                    135               115235
Tom Jones        Gold               DL222            Boeing 777   264                    1765              205767
Jessica James    Silver             DL143            Boeing 747   400                    135               127656
Sam Rio          None               DL143            Boeing 747   400                    135               2653
Ana Janco        Silver             DL222            Boeing 777   264                    1765              136773
Jennifer Cortez  Gold               DL222            Boeing 777   264                    1765              300582
Jessica James    Silver             DL122            Airbus A330  236                    4370              127656
Sam Rio          None               DL37             Boeing 747   400                    531               2653
Christian Janco  Silver             DL222            Boeing 777   264                    1765              14642


Normalization Process:

1. First Normal Form (1NF):
   - Already in 1NF as each column has atomic values.

2. Second Normal Form (2NF):
   - Ensure it is in 1NF and all non-key attributes are fully functional dependent on the primary key.
   - Identify the primary key: composite key of Customer Name and Flight Number.

3. Third Normal Form (3NF):
   - Ensure it is in 2NF and all attributes are only dependent on the primary key.
   - No transitive dependency.

Final Tables:

- Customers
  
  customer_id  customer_name     customer_status  total_mileage
  -------------------------------------------------------------
  1            Agustine Riviera  Silver           115235
  2            Alaina Sepulvida  None             6008
  3            Tom Jones         Gold             205767
  4            Sam Rio           None             2653
  5            Jessica James     Silver           127656
  6            Ana Janco         Silver           136773
  7            Jennifer Cortez   Gold             300582
  8            Christian Janco   Silver           14642
  

- Flights
  
  flight_id  flight_number  aircraft    total_seats  flight_mileage
  ----------------------------------------------------------------
  1          DL143          Boeing 747  400          135
  2          DL122          Airbus A330 236          4370
  3          DL53           Boeing 777  264          2078
  4          DL222          Boeing 777  264          1765
  5          DL37           Boeing 747  400          531
  

- Bookings
  
  booking_id  customer_id  flight_id
  ----------------------------------
  1           1            1
  2           1            2
  3           2            2
  4           3            2
  5           3            3
  6           3            4
  7           4            1
  8           5            1
  9           6            4
  10          7            4
  11          8            4
  

DDL Scripts:
sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50),
    total_mileage INT
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL,
    aircraft VARCHAR(50),
    total_seats INT,
    flight_mileage INT
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Customers (customer_id, customer_name, customer_status, total_mileage) VALUES 
(1, 'Agustine Riviera', 'Silver', 115235),
(2, 'Alaina Sepulvida', 'None', 6008),
(3, 'Tom Jones', 'Gold', 205767),
(4, 'Sam Rio', 'None', 2653),
(5, 'Jessica James', 'Silver', 127656),
(6, 'Ana Janco', 'Silver', 136773),
(7, 'Jennifer Cortez', 'Gold', 300582),
(8, 'Christian Janco', 'Silver', 14642);

INSERT INTO Flights (flight_id, flight_number, aircraft, total_seats, flight_mileage) VALUES
(1, 'DL143', 'Boeing 747', 400, 135),
(2, 'DL122', 'Airbus A330', 236, 4370),
(3, 'DL53', 'Boeing 777', 264, 2078),
(4, 'DL222', 'Boeing 777', 264, 1765),
(5,

 'DL37', 'Boeing 747', 400, 531);

INSERT INTO Bookings (booking_id, customer_id, flight_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 2),
(5, 3, 3),
(6, 3, 4),
(7, 4, 1),
(8, 5, 1),
(9, 6, 4),
(10, 7, 4),
(11, 8, 4);


### Part 2: SQL Queries

1. Get the total number of flights in the database:
   sql
   SELECT COUNT() AS total_flights FROM Flights;
   

2. Get the average flight distance:
   sql
   SELECT AVG(flight_mileage) AS average_distance FROM Flights;
   

3. Get the average number of seats:
   sql
   SELECT AVG(total_seats) AS average_seats FROM Flights;
   

4. Get the average number of miles flown by customers grouped by status:
   sql
   SELECT customer_status, AVG(total_mileage) AS average_mileage
   FROM Customers
   GROUP BY customer_status;
   

5. Get the maximum number of miles flown by customers grouped by status:
   sql
   SELECT customer_status, MAX(total_mileage) AS max_mileage
   FROM Customers
   GROUP BY customer_status;
   

6. Get the total number of aircraft with a name containing Boeing:
   sql
   SELECT COUNT() AS total_boeing_aircraft
   FROM Flights
   WHERE aircraft LIKE '%Boeing%';
   

7. Find all flights with a distance between 300 and 2000 miles:
   sql
   SELECT  FROM Flights
   WHERE flight_mileage BETWEEN 300 AND 2000;
   

8. Find the average flight distance booked grouped by customer status:
   sql
   SELECT c.customer_status, AVG(f.flight_mileage) AS average_flight_distance
   FROM Bookings b
   JOIN Customers c ON b.customer_id = c.customer_id
   JOIN Flights f ON b.flight_id = f.flight_id
   GROUP BY c.customer_status;
   

9. Find the most often booked aircraft by gold status members:
   sql
   SELECT f.aircraft, COUNT() AS booking_count
   FROM Bookings b
   JOIN Customers c ON b.customer_id = c.customer_id
   JOIN Flights f ON b.flight_id = f.flight_id
   WHERE c.customer_status = 'Gold'
   GROUP BY f.aircraft
   ORDER BY booking_count DESC
   LIMIT 1;
   

