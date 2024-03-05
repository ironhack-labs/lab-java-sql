CREATE SCHEMA blog;

CREATE TABLE blog.authors(
    author_id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(255),
    PRIMARY KEY (author_id)
 );

CREATE TABLE blog.title(
    title_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    word_count VARCHAR(255),
    views VARCHAR(255),
    author_id INT NOT NULL,
    PRIMARY KEY (title_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
 );

INSERT INTO blog.authors(author_name) VALUES
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");

INSERT INTO blog.title(title, word_count,views,author_id) VALUES
("Best Paint Colors",814,14,1),
("Small Space Decorating Tips", 1146,221,2),
("Hot Accessories", 986 ,105,1),
("Mixing Textures", 765, 22,1),
("Kitchen Refresh", 1242, 307,2),
("Homemade Art Hacks", 1002, 193,1),
("Refinishing Wood Floors", 1571,7542,3);


