DROP SCHEMA IF EXISTS authors
CREATE SCHEMA authors
USE authors
    
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE blog_entries (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO authors (name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO blog_entries (title, word_count, views, author_id) VALUES
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);












































)