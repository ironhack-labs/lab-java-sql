CREATE DATABASE IF NOT EXISTS lab;

CREATE TABLE IF NOT EXISTS lab.exercise1(
	author VARCHAR(50) NOT NULL,
    title VARCHAR(250),
    word_count INT,
    views INT
);

CREATE TABLE IF NOT EXISTS lab.authors(
	author_id INT auto_increment PRIMARY KEY,
    author VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS lab.normalized_ddl(
	id INT auto_increment PRIMARY KEY,
	author VARCHAR(50) NOT NULL,
    author_id INT,
    title VARCHAR(250),
    word_count INT,
    views INT,
    
    FOREIGN KEY (author_id) REFERENCES lab.authors(author_id)
    );


INSERT INTO lab.exercise1(author, title, word_count, views) VALUES
	("Maria Charlotte", "Best Paint Colors", 814, 14),
    ("Juan Perez", "Small Space Decorating Tips", 1146, 221),
    ("Maria Charlotte", "Hot Accessories", 986, 105),
    ("Maria Charlotte", "Mixing Textures", 765, 22),
    ("Maria Charlotte", "Kitchen Refresh", 1242, 307),
    ("Juan Perez", "Homemade Art Hacks", 1002, 193),
    ("Gemma Alcoce", "Refinishing Wood Floors", 1571, 7542);
    
INSERT INTO lab.authors(author)
SELECT DISTINCT(author)
FROM lab.exercise1;

-- Normalized BD
INSERT INTO lab.normalized_ddl (author, author_id, title, word_count, views)
SELECT a.author, b.author_id, a.title, a.word_count, a.views
FROM lab.exercise1 AS a
LEFT JOIN lab.authors AS b
ON a.author = b.author;


	