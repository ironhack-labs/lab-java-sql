#Script to test datas for blog database
USE blogs;
SELECT *
FROM author;

SELECT a.name
FROM author a;

SELECT a.name AS 'Full name' FROM author a;

SELECT COUNT(*) FROM author;

SELECT *
FROM post;

SELECT COUNT(*) FROM post;

SELECT AVG(p.word_count)
FROM post p;

SELECT AVG(p.views)
FROM post p;

SELECT MIN(post.views) FROM post;
SELECT MAX(post.views) FROM post;