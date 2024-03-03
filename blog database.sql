CREATE DATABASE IF NOT EXISTS lab_java_sql;

-- Switch to the new database
USE lab_java_sql;

-- Create Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- Create BlogPosts Table
CREATE TABLE BlogPosts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Insert Data into Authors Table
INSERT INTO Authors (author_name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

-- Insert Data into BlogPosts Table
INSERT INTO BlogPosts (title, word_count, views, author_id) VALUES
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);
