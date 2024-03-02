
-- 1 Normalize the following blog database and write the DDL scripts to create the database tables: 

CREATE DATABASE LAB_3_02_Blog;

use LAB_3_02_Blog;

CREATE TABLE Author (
	author_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE BlogPost (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
	author_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    author_name VARCHAR(255),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

INSERT INTO Author (author_name) VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');


INSERT INTO BlogPost (title, word_count, views, author_name) VALUES
	(1,"Best Paint Colors",814,14),
	(2,"Small Space Decorating Tips",1146,221),
	(1,"Hot Accessories",986,104),
	(1,"Mixing Textures",765,22),
	(2,"Kitchen Refresh",1242,307),
	(1,"Homemade Art Hacks",1002,193),
	(3,"Refinishing Wood Floors",1571,7542);
    

  