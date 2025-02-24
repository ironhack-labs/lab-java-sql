DROP SCHEMA IF EXISTS books;
CREATE SCHEMA books;
USE books;

-- DDL 
CREATE TABLE book(
	id INT NOT NULL AUTO_INCREMENT,
	book_title VARCHAR(255),
	word_count INT,
	views INT,
	PRIMARY KEY(id)
);

CREATE TABLE author(
	id INT NOT NULL AUTO_INCREMENT,
	author_name VARCHAR(255),
	book_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(book_id) REFERENCES book(id)
);

