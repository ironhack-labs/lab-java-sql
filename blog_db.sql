CREATE DATABASE IF NOT EXISTS blog_db;
USE blog_db;

-- Create authors table
CREATE TABLE IF NOT EXISTS Authors(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
author_name VARCHAR(255) NOT NULL
);

-- Create books table
CREATE TABLE IF NOT EXISTS Books(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
author_id INT NOT NULL,
title VARCHAR(255) NOT NULL,
word_count INT NOT NULL,
views INT NOT NULL,
FOREIGN KEY (author_id) REFERENCES Authors(id)
);

-- Insert data into Authors table
INSERT INTO Authors (author_name) VALUES 
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");

-- Insert data into Books table
INSERT INTO Books (author_id, title, word_count, views) VALUES
(1,"Best Paint Colors",814,14),
(2,"Small Space Decorating Tips",1146,221),
(1,"Hot Accessories",986,104),
(1,"Mixing Textures",765,22),
(2,"Kitchen Refresh",1242,307),
(1,"Homemade Art Hacks",1002,193),
(3,"Refinishing Wood Floors",1571,7542);