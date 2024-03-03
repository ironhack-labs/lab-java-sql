CREATE DATABASE blog_lab;
USE blog_lab;

-- Create the author table (if it doesn't exist)
CREATE TABLE IF NOT EXISTS author(
    id_author INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(65),
    PRIMARY KEY (id_author)
);

-- Create the book table (if it doesn't exist)
CREATE TABLE IF NOT EXISTS book(
    id_book INT AUTO_INCREMENT PRIMARY KEY,
	id_author INT,
	title VARCHAR(255),
    word_count INT,
    views INT,
    PRIMARY KEY (id_book),
    FOREIGN KEY (id_author) REFERENCES author(id_author)
);

-- Insert data into the Author table
INSERT INTO author (name) 
VALUES 
	('Maria Charlotte'),
	('Juan Perez'),
	('Gemma Alcocer');

-- Insert data into the Book table
INSERT INTO book (id_author, title, word_count, views) 
VALUES
	(1, 'Best Paint Colors', 814, 14),
    (2, 'Small Space Decorating Tips', 1146, 221),
    (1, 'Hot Accessories', 986, 105),
    (1, 'Mixing Textures', 765, 22),
    (2, 'Kitchen Refresh', 1242, 307),
    (1, 'Homemade Art Hacks', 1002, 193),
    (3, 'Refinishing Wood Floors', 1571, 7542);
    
-- All operations completed successfully
    