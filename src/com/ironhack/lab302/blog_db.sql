CREATE SCHEMA blog_db;
USE blog_db;

CREATE TABLE author (
	author_id INT NOT NULL AUTO_INCREMENT,
	author VARCHAR (255),
	PRIMARY KEY (author_id)	
);

CREATE TABLE blog (
	blog_id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR (255),
	word_count INT,
	views INT,
	author_id INT NOT NULL,
	PRIMARY KEY (blog_id),
	FOREIGN KEY (author_id) REFERENCES author(author_id)
);

