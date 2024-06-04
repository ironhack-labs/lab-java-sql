| author          |	| title                       |	| word count |	| views |
| --------------- |	| --------------------------- |	| ---------- |	| ----- |
| Maria Charlotte |	| Best Paint Colors           |	| 814        |	| 14    |
| Juan Perez      |	| Small Space Decorating Tips |	| 1146       |	| 221   |
| Maria Charlotte |	| Hot Accessories             |	| 986        |	| 105   |
| Maria Charlotte |	| Mixing Textures             |	| 765        |	| 22    |
| Juan Perez      |	| Kitchen Refresh             |	| 1242       |	| 307   |
| Maria Charlotte |	| Homemade Art Hacks          |	| 1002       |	| 193   |
| Gemma Alcocer   |	| Refinishing Wood Floors     |	| 1571       |	| 7542  |



-- After normalization we get 2 common groups, we remove the duplicates where applicable
author_id	| author          |
----------- | --------------- |
1	        | Maria Charlotte |
2	        | Juan Perez      |
3	        | Gemma Alcocer   |

-- Then the leftover is the 2nd group
title_id	| title                       |	| word count |	| views |
----------- | --------------------------- |	| ---------- |	| ----- |
1	        | Best Paint Colors           |	| 814        |	| 14    |
2	        | Small Space Decorating Tips |	| 1146       |	| 221   |
3	        | Hot Accessories             |	| 986        |	| 105   |
4	        | Mixing Textures             |	| 765        |	| 22    |
5	        | Kitchen Refresh             |	| 1242       |	| 307   |
6	        | Homemade Art Hacks          |	| 1002       |	| 193   |
7	        | Refinishing Wood Floors     |	| 1571       |	| 7542  |

-- Create Authors table
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
);
