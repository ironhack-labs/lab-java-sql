CREATE TABLE Authors (
                         author_id INT AUTO_INCREMENT PRIMARY KEY,
                         author_name VARCHAR(100)
);

-- Create Articles table
CREATE TABLE Articles (
                          article_id INT AUTO_INCREMENT PRIMARY KEY,
                          author_id INT,
                          title VARCHAR(100),
                          word_count INT,
                          views INT,
                          FOREIGN KEY (author_id) REFERENCES Authors(author_id)
