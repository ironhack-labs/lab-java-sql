![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# LAB Java | SQL

## Introduction

We have just learned how to normalize database as well as how to create database schema and how to perform complex SQL queries so let's practice a bit more.

<br>

## Requirements

1. Fork this repo.
2. Clone this repo.
3. Add your instructor and the class graders as collaborators to your repository. If you are unsure who your class graders are, ask your instructor or refer to the day 1 slide deck.
4. In the repository, create a Java project and add the code for the following prompts.

## Submission

Once you finish the assignment, submit a URL link to your repository or your pull request in the field below.

<br>

## Instructions

1.  Normalize the following blog database and write the DDL scripts to create the database tables:

| author          | title                       | word count | views |
| --------------- | --------------------------- | ---------- | ----- |
| Maria Charlotte | Best Paint Colors           | 814        | 14    |
| Juan Perez      | Small Space Decorating Tips | 1146       | 221   |
| Maria Charlotte | Hot Accessories             | 986        | 105   |
| Maria Charlotte | Mixing Textures             | 765        | 22    |
| Juan Perez      | Kitchen Refresh             | 1242       | 307   |
| Maria Charlotte | Homemade Art Hacks          | 1002       | 193   |
| Gemma Alcocer   | Refinishing Wood Floors     | 1571       | 7542  |

| author   ID | Author          |   | Author ID | title                       | word count | views |        
|-------------|-----------------|---|-----------|-----------------------------|------------|-------|
| 1           | Maria Charlotte |   | 1         | Best Paint Colors           | 814        | 14    |
| 2           | Juan Perez      |   | 2         | Small Space Decorating Tips | 1146       | 221   |
| 3           | Gemma Alcocer   |   | 1         | Hot Accessories             | 986        | 105   |
|             |                 |   | 1         | Mixing Textures             | 765        | 22    |
|             |                 |   | 2         | Kitchen Refresh             | 1242       | 307   |
|             |                 |   | 1         | Homemade Art Hacks          | 1002       | 193   |
|             |                 |   | 3         | Refinishing Wood Floors     | 1571       | 7542  |

<br>

2.  Normalize the following airline database and write the DDL scripts to create the database tables:
3. GOING TO NORMALIZE HERE.

| Customer Name    | cID | Customer Status | Total Customer Mileage |   | Aircraft    | Aircraft ID | Aircraft Seats |     | cID | Flight Number | Aircraft ID | Flight Mileage |
|------------------|-----|-----------------|------------------------|---|-------------|-------------|----------------|-----|-----|---------------|-------------|----------------|
| Agustine Riviera | 1   | Silver          | 115235                 |   | Boeing 747  | 1           | 400            |     | 1   | DL143         | 1           | 135            |
| Alaina Sepulvida | 2   | None            | 6008                   |   | Airbus A330 | 2           | 236            |     | 1   | DL122         | 2           | 4370           |
| Tom Jones        | 3   | Gold            | 205767                 |   | Boeing 777  | 3           | 264            |     | 2   | DL122         | 2           | 4370           |
| Sam Rio          | 4   | None            | 2653                   |   |             |             |                |     | 3   | DL122         | 2           | 4370           |
| Jessica James    | 5   | Silver          | 127656                 |   |             |             |                |     | 3   | DL53          | 3           | 2078           |
| Ana Janco        | 6   | Silver          | 136773                 |   |             |             |                |     | 4   | DL143         | 1           | 135            |
| Jennifer Cortez  | 7   | Gold            | 300582                 |   |             |             |                |     | 3   | DL222         | 3           | 1765           |
| Christian Janco  | 8   | Silver          | 14642                  |   |             |             |                |     | 5   | DL143         | 1           | 135            |
|                  |     |                 |                        |   |             |             |                |     | 6   | DL222         | 3           | 1765           |
|                  |     |                 |                        |   |             |             |                |     | 7   | DL222         | 3           | 1765           |
|                  |     |                 |                        |   |             |             |                |     | 5   | DL122         | 2           | 4370           |
|                  |     |                 |                        |   |             |             |                |     | 4   | DL37          | 1           | 531            |
|                  |     |                 |                        |   |             |             |                |     | 8   | DL222         | 3           | 1765           |
 Feel Satisfied with this normalization.
       
 drop schema if exists test;   
 create schema  test;
 use test;
 
 drop table if exists customer;
 create table if not exists customer (
 	cId INT auto_increment,
 	customer_status VARCHAR(255),
 	customer_name VARCHAR(255),
 	total_customer_mileage INT,
 	primary key (cId)
 )ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
 
 drop table if exists aircraft;
 create table if not exists aircraft (
 	aircraft_id INT auto_increment,
 	aircraft_name VARCHAR(255),
 	aircraft_seats smallint,
 	primary key (aircraft_id)
 )ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
 
 drop table if exists flights;
 create table if not exists flights(
 customer_id INT,
 flight_number VARCHAR(255),
 aircraft_id INT,
 flight_mileage INT,
 foreign key (customer_id) references customer(cId),
 foreign key (aircraft_id) references aircraft(aircraft_id)
 )ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
 
 
 insert into customer (customer_status, customer_name, total_customer_mileage)values
 ('Silver','Agustine Rivera', 115235), ('None','Alaina Sepulvida', 6008), ('Gold','Tom Jones',205767),
 ('None', 'Sam Rio', 2653), ('Silver','Jessica James', 127656), ('Silver', 'Ana janco', '136773'),
 ('Gold', 'Jennifer Cortez', 300582), ('Silver', 'Christian Janco', 14642);
 
 insert into aircraft (aircraft_name, aircraft_seats) values ('Boeing 747',400), ('Airbus A330',236), ('Boeing 777', 264);
 
 insert into flights (customer_id, flight_number, aircraft_id, flight_mileage)values(1,'DL143',1,135),(1,'DL122',2,4370),(2,'DL122',2,4370),(3,'DL122',2,4370),
 (3,'DL53',3,2078),(4,'DL143',1,135),(3,'DL222',3,1765),(5,'DL143',1,135), (6,'DL222',3,1765), (7, 'DL222',3,1765),(5,'DL122',2,4370), (4,'DL37',1,531),(8,'DL222',3,1765);
 
 select count(flight_number) from flights;
 select avg(flight_mileage) from flights; 
 select avg(aircraft_seats) from aircraft;
 select avg(total_customer_mileage) from customer group by customer_status;
 select max(total_customer_mileage) from customer group by customer_status; 
 select count(*) from aircraft where aircraft_name like 'Boeing%';
 select count(*) from flights where flight_mileage between 300 and 2000;
 select c.customer_status, avg(flight_mileage) from customer c join flights f on c.cId = f.customer_id group by c.customer_status;
 select a.aircraft_name, count(*) from customer c join flights f on c.cId = f.customer_id join aircraft a on f.aircraft_id = a.aircraft_id where c.customer_status = 'Gold' group by a.aircraft_id, a.aircraft_name order by count(*) desc limit 1;
 



<br>

3. In the Airline database write the SQL script to get the total number of flights in the database.
4. In the Airline database write the SQL script to get the average flight distance.
5. In the Airline database write the SQL script to get the average number of seats.
6. In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
7. In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
8. In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
9. In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
10. In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
11. In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).


                                                   
HERE IS MY SQL:



<br>

## FAQs

<br>

<details>
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">I am stuck and don't know how to solve the problem or where to start. What should I do?</summary>

  <br> <!-- ✅ -->

  If you are stuck in your code and don't know how to solve the problem or where to start, you should take a step back and try to form a clear, straight forward question about the specific issue you are facing. The process you will go through while trying to define this question, will help you narrow down the problem and come up with potential solutions.

  For example, are you facing a problem because you don't understand the concept or are you receiving an error message that you don't know how to fix? It is usually helpful to try to state the problem as clearly as possible, including any error messages you are receiving. This can help you communicate the issue to others and potentially get help from classmates or online resources.

  Once you have a clear understanding of the problem, you should be able to start working toward the solution.

 </details>

<br>

<details>
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">How to Create a Table and Insert Data into it in SQL?</summary>

  <br> <!-- ✅ -->

  Creating a table and inserting data into it are the two most basic tasks you will perform in SQL. Here's how you can do it:

  1. Creating a Table

  To create a table, you need to use the CREATE TABLE statement. Here's an example of how you can create a table named "employees":

  ```sql
  CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
  );
  ```

  2. Inserting Data into a Table

  Once you have created a table, you can insert data into it. To insert data, you use the INSERT INTO statement. Here's an example of how you can insert data into the "employees" table:

  ```sql
  INSERT INTO employees (name, age, salary)
  VALUES ('John Doe', 32, 50000),
        ('Jane Doe', 28, 45000),
        ('Jim Smith', 40, 55000);
  ```

  The above code inserts three rows into the "employees" table. You can insert as many rows as you like, just separate each row by a comma.

 </details>

<br>

<details>
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">What is the difference between using "INNER JOIN", "LEFT JOIN", "RIGHT JOIN" and "FULL OUTER JOIN" in SQL?</summary>

  <br> <!-- ✅ -->

  An `INNER JOIN` returns only the rows that have matching values in both tables. It returns only the common values.

  A `LEFT JOIN` returns all the rows from the left table and matching values from the right table. If there is no match, it returns NULL values.

  A `RIGHT JOIN` returns all the rows from the right table and matching values from the left table. If there is no match, it returns NULL values.

  A `FULL OUTER JOIN` returns all the rows from both tables, including matching and non-matching values. If there is no match, it returns NULL values.

  Code Snippets:

  INNER JOIN:

  ```sql
  SELECT *
  FROM table1
  INNER JOIN table2
  ON table1.column = table2.column;
  ```

  LEFT JOIN:

  ```sql
  SELECT *
  FROM table1
  LEFT JOIN table2
  ON table1.column = table2.column;
  ```

  RIGHT JOIN:

  ```sql
  SELECT *
  FROM table1
  RIGHT JOIN table2
  ON table1.column = table2.column;
  ```

  FULL OUTER JOIN:

  ```sql
  SELECT *
  FROM table1
  FULL OUTER JOIN table2
  ON table1.column = table2.column;
  ```

  <br>

   

</details>

<br>

<details>
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">What is the purpose of using "GROUP BY", "ORDER BY" and "LIMIT" in SQL?</summary>

  <br> <!-- ✅ -->

  1. `GROUP BY` in SQL is used to group together rows that have the same values in specified columns. This is useful when you want to perform aggregate functions (such as SUM, AVG, MIN, MAX) on each group, rather than on the entire result set. For example, if you have a table of sales transactions and you want to see the total sales for each salesperson, you would use the following SQL code:

   ```sql
   SELECT salesperson, SUM(sales)
   FROM sales_table
   GROUP BY salesperson;
   ```

  2. `ORDER BY` in SQL is used to sort the result set in ascending or descending order based on one or more columns. For example, if you have a table of customers and you want to see the list sorted by last name, you would use the following SQL code:

   ```sql
   SELECT *
   FROM customers
   ORDER BY last_name;
   ```

  3. `LIMIT` in SQL is used to specify the maximum number of rows to be returned to the result set. For example, if you only want to see the first 10 customers in the list, you would use the following SQL code:

   ```sql
   SELECT *
   FROM customers
   LIMIT 10;
   ```

  By combining these statements, you can produce sophisticated queries that can meet a wide range of needs.

  <br>

   

</details>

<br>

<details>
  <summary style="font-size: 16px; cursor: pointer; outline: none; font-weight: bold;">I am unable to push changes to my repository. What should I do?</summary>

  <br> <!-- ✅ -->

  If you are unable to push changes to your repository, here are a few steps that you can follow:

  1. Check your internet connection: Ensure that your internet connection is stable and working.
  1. Verify your repository URL: Make sure that you are using the correct repository URL to push your changes.
  2. Check Git credentials: Ensure that your Git credentials are up-to-date and correct. You can check your credentials using the following command:

  ```bash
  git config --list
  ```

  4. Update your local repository: Before pushing changes, make sure that your local repository is up-to-date with the remote repository. You can update your local repository using the following command:

  ```bash
  git fetch origin
  ```

  5. Check for conflicts: If there are any conflicts between your local repository and the remote repository, resolve them before pushing changes.
  6. Push changes: Once you have resolved any conflicts and updated your local repository, you can try pushing changes again using the following command:

  ```bash
  git push origin <branch_name>
  ```

</details>
