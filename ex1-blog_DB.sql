CREATE TABLE Author(
author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
author_name VARCHAR(255) NOT NULL
);

CREATE TABLE Books(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
author_id INT NOT NULL,
title VARCHAR(255) NOT NULL,
word_count INT NOT NULL,
views INT NOT NULL,
	FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

INSERT INTO Authors (author_name) VALUES
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");

INSERT INTO Books (author_id, title, word_count, views) VALUES
(1,"Best Paint Colors",814,14),
(2,"Small Space Decorating Tips",1146,221),
(1,"Hot Accessories",986,104),
(1,"Mixing Textures",765,22),
(2,"Kitchen Refresh",1242,307),
(1,"Homemade Art Hacks",1002,193),
(3,"Refinishing Wood Floors",1571,7542);