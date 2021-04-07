alter table books add column author_id int;

CREATE TABLE authors (id SERIAL PRIMARY KEY, name VARCHAR(255));

alter table books add CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(id);

INSERT INTO authors(name) SELECT DISTINCT author FROM books;

SELECT COUNT(*) FROM authors;

UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

SELECT author_id FROM books; 

ALTER TABLE books DROP COLUMN author;