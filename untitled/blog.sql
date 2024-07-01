DROP SCHEMA IF EXISTS blogdb;
CREATE SCHEMA blogdb;
USE blogdb;

-- Blog Database DDL Statements
CREATE TABLE blogdb.Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE blogdb.Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    FOREIGN KEY (author_id) REFERENCES blogdb.Authors(author_id)
);

-- Insert sample data into Authors
INSERT INTO blogdb.Authors (name) VALUES
('Alice Johnson'),
('Bob Smith'),
('Charlie Brown'),
('Diana Ross');

-- Insert sample data into Posts
INSERT INTO blogdb.Posts (author_id, title, word_count, views) VALUES
(1, 'How to Start Blogging', 1200, 150),
(1, 'Advanced Blogging Tips', 1500, 200),
(2, 'The Basics of SEO', 800, 300),
(3, 'Content Marketing Strategies', 950, 250),
(4, 'The Importance of Social Media', 1100, 400);

-- SQL Queries for the Blog Database

-- 1. Total number of posts
SELECT COUNT(*) AS total_posts FROM blogdb.Posts;

-- 2. Average word count per post
SELECT AVG(word_count) AS average_word_count FROM blogdb.Posts;

-- 3. Total views per author
SELECT a.name, SUM(p.views) AS total_views
FROM blogdb.Authors a
JOIN blogdb.Posts p ON a.author_id = p.author_id
GROUP BY a.name;

-- 4. Average word count grouped by author
SELECT a.name, AVG(p.word_count) AS average_word_count
FROM blogdb.Authors a
JOIN blogdb.Posts p ON a.author_id = p.author_id
GROUP BY a.name;

-- 5. Author with the most views
SELECT a.name, SUM(p.views) AS total_views
FROM blogdb.Authors a
JOIN blogdb.Posts p ON a.author_id = p.author_id
GROUP BY a.name
ORDER BY total_views DESC
LIMIT 1;

-- 6. Posts with more than 1000 words
SELECT * FROM blogdb.Posts
WHERE word_count > 1000;

-- 7. Posts with views between 200 and 500
SELECT * FROM blogdb.Posts
WHERE views BETWEEN 200 AND 500;

-- 8. Average views per post grouped by author
SELECT a.name, AVG(p.views) AS average_views
FROM blogdb.Authors a
JOIN blogdb.Posts p ON a.author_id = p.author_id
GROUP BY a.name;

-- 9. Most viewed post
SELECT title, views
FROM blogdb.Posts
ORDER BY views DESC
LIMIT 1;
