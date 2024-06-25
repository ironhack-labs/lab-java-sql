DROP SCHEMA IF EXISTS blog;
CREATE SCHEMA blog;
USE blog;


-- Create the Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL
);

-- Create the BlogPosts table
CREATE TABLE BlogPosts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorID INT,
    Title VARCHAR(255) NOT NULL,
    WordCount INT,
    Views INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);