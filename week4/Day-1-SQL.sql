SELECT * FROM books;

SELECT id, isbn, title FROM books;
SELECT books.id, books.isbn, books.title FROM books;

SELECT id, isbn, title FROM books ORDER BY title DESC;

SELECT * FROM books WHERE year = '2002' AND publisher = 'Mira';

SELECT * FROM ratings WHERE rating >= 9;

SELECT * FROM books WHERE publisher in ('Dell', 'Apple');
SELECT * FROM books WHERE (publisher = 'Dell' OR publisher = 'Apple') AND year = '1972';

SELECT * FROM books WHERE publisher like 'Avon%';
SELECT * FROM books WHERE publisher like '%a%';

SELECT *
FROM books
WHERE lower(publisher) LIKE '%a%';

SELECT * FROM books WHERE year > 2010;

SELECT * FROM books LIMIT 10;
SELECT * FROM books LIMIT 10 OFFSET 10;


SELECT *
FROM books
JOIN ratings ON books.isbn = ratings.isbn
LIMIT 100;

SELECT b.id, b.isbn, b.title, r.rating
FROM books b
JOIN ratings r ON b.isbn = r.isbn
WHERE b.id = 365264;

SELECT b.id, b.isbn, b.title, r.rating
FROM books b
LEFT JOIN ratings r ON b.isbn = r.isbn
WHERE r.id is NULL;

SELECT count(b.id)
FROM books b
LEFT JOIN ratings r ON b.isbn = r.isbn
WHERE r.id is NULL;


SELECT b.id, b.isbn, b.title, avg(r.rating)
FROM books b
JOIN ratings r ON b.isbn = r.isbn
WHERE b.id = 365264 AND rating > 0
GROUP BY b.id, b.isbn, b.title;


SELECT b.publisher, b.year, avg(r.rating), count(r.rating)
FROM books b
JOIN ratings r ON b.isbn = r.isbn
WHERE rating > 0
GROUP BY b.publisher, b.year;

SELECT b.id, b.isbn, b.title, avg(r.rating), count(r.rating)
FROM books b
JOIN ratings r ON b.isbn = r.isbn
WHERE rating > 0
GROUP BY b.id, b.isbn, b.title
HAVING avg(r.rating) >= 9 AND count(r.rating) > 1
ORDER BY avg(r.rating) DESC, count(r.rating) DESC;

SELECT b.id, b.isbn, b.title, avg(r.rating) as Average, count(r.rating) as Count
FROM books b
JOIN ratings r ON b.isbn = r.isbn
WHERE rating > 0
GROUP BY b.id, b.isbn, b.title
HAVING avg(r.rating) >= 9 AND count(r.rating) > 1
ORDER BY Average DESC, Count DESC;
