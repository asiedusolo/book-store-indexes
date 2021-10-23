SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * 
FROM pg_indexes
WHERE tablename = 'customers';

SELECT * 
FROM pg_indexes
WHERE tablename = 'books';

SELECT * 
FROM pg_indexes
WHERE tablename = 'orders';

CREATE INDEX orders_customers_id_idx ON orders(customer_id);

CREATE INDEX orders_book_id_idx ON orders(book_id);

EXPLAIN ANALYZE 
SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty
(pg_total_relation_size('books'));

CREATE INDEX books_original_language_title_sales_in_millions_idx
ON books(original_language, title, sales_in_millions);

EXPLAIN ANALYZE 
SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty
(pg_total_relation_size('books'));

DROP INDEX IF EXISTS books_original_language_title_sales_in_millions_idx;

DROP INDEX IF EXISTS orders_customers_id_idx;
DROP INDEX IF EXISTS orders_book_id_idx;

SELECT NOW();
 
\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;
 
SELECT NOW();

DROP INDEX IF EXISTS orders_customers_id_idx;
DROP INDEX IF EXISTS orders_book_id_id