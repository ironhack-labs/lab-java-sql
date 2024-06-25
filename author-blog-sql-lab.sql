DROP DATABASE IF EXISTS lab_java_sql;
CREATE DATABASE lab_java_sql;
USE lab_java_sql;

CREATE TABLE author (
    author_id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE table blog_post (
	title varchar (255) not null,
	word_count int,
	views int,
	author_id INT NOT NULL,
	PRIMARY KEY (title),
	FOREIGN KEY (author_id) REFERENCES author(author_id)
);


INSERT INTO author (author_name) VALUES 
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO blog_post (title, word_count, views, author_id) VALUES
('Best Paint Colors', 814, 14, 1),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Homemade Art Hacks', 1002, 193, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Kitchen Refresh', 1242, 307, 2),
('Refinishing Wood Floors', 1571, 7542, 3);


SELECT * FROM author;

SELECT * FROM blog_post;


