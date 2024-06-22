--
-- CREATE TABLE book(
--     book_id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(50),
--     author VARCHAR(30),
--     price DECIMAL(8, 2),
--     amount INT
-- );
--
-- INSERT INTO book (title, author, price, amount)
-- VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3);
-- SELECT *
-- FROM book
--
-- INSERT INTO book (title, author, price, amount)
-- VALUES (
--         'Белая гвардия',
--         'Булгаков М.А.',
--         540.50,
--         5
--     ),
--     (
--         'Идиот',
--         'Достоевский Ф.М.',
--         460.00,
--         10
--     ),
--     (
--         'Братья Карамазовы',
--         'Достоевский Ф.М.',
--         799.01,
--         2
--     );
-- SELECT *
-- FROM book;
--
-- SELECT *
-- FROM book;
--
-- SELECT author,
--     title,
--     price
-- FROM book;
--
-- SELECT title AS Название,
--     amount
-- FROM book;
-- SELECT title AS Название,
--     author AS Автор
-- FROM book;
--
-- SELECT title,
--     author,
--     price,
--     amount,
--     price * amount AS total
-- FROM book;
--
-- SELECT title,
--     amount,
--     1.65 * amount AS pack
-- FROM book;
--
-- SELECT title,
--     price,
--     (price * 18 / 100) /(1 + 18 / 100) AS tax,
--     price /(1 + 18 / 100) AS price_tax
-- FROM book;
--
-- SELECT title,
--     price,
--     ROUND((price * 18 / 100) /(1 + 18 / 100), 2) AS tax,
--     ROUND(price /(1 + 18 / 100), 2) AS price_tax
-- FROM book;
--
-- SELECT title,
--     author,
--     amount,
--     ROUND(price * 0.7, 2) AS new_price
-- FROM book;
--
-- SELECT title,
--     amount,
--     price,
--     IF(amount < 4, price * 0.5, price * 0.7) AS sale
-- FROM book;
--
-- SELECT title,
--     amount,
--     price,
--     ROUND(IF(amount < 4, price * 0.5, price * 0.7), 2) AS sale
-- FROM book;
--
-- SELECT
--     title,
--     amount,
--     price,
--     ROUND(
--         IF(
--             amount < 4,
--             price * 0.5,
--             IF(amount < 11, price * 0.7, price * 0.9)
--         ),
--         2
--     ) AS sale,
--     IF(
--         amount < 4,
--         'скидка 50%',
--         IF(amount < 11, 'скидка 30%', 'скидка 10%')
--     ) AS Ваша_скидка
-- FROM
--     book;
-- SELECT
--     author,
--     title,
--     ROUND(
--         IF (
--             author = 'Булгаков М.А.',
--             price * 1.1,
--             IF (author = 'Есенин С.А.', price * 1.05, price)
--         ),
--         2
--     ) AS new_price,
-- FROM
--     book;
-- 
--
-- SELECT title,
--     price
-- FROM book
-- WHERE price < 600;
--
-- SELECT title,
--     author,
--     price * amount AS total
-- FROM book
-- WHERE price * amount > 4000;
--
-- SELECT
--     author,
--     title,
--     price
-- FROM
--     book
-- WHERE
--     amount < 10;
-- 
-- SELECT
--     title,
--     author,
--     price
-- FROM
--     book
-- WHERE
--     price > 600
--     AND author = 'Булгаков М.А.';
--
-- SELECT
--     title,
--     author,
--     price,
--     amount
-- FROM
--     book
-- WHERE
--     (
--         price < 500
--         OR price > 600
--     )
--     AND price * amount >= 5000;
--
-- SELECT
--     title,
--     author
-- FROM
--     book
-- WHERE
--     price BETWEEN 540.5
--     AND 800
--     AND amount IN (2, 3, 5, 7);
--
-- SELECT
--     author,
--     title
-- FROM
--     book
-- WHERE
--     amount BETWEEN 2
--     AND 14
-- ORDER BY
--     author DESC,
--     title ASC;
--
-- SELECT
--     title,
--     author
-- FROM
--     book
-- WHERE
--     title LIKE "%_ _%"
--     AND author LIKE "%С.%"
-- ORDER BY
--     title;
--
-- SELECT
--     amount
-- FROM
--     book
-- GROUP BY
--     amount
--
-- SELECT
--     author AS Автор,
--     COUNT(title) AS Различных_книг,
--     SUM(amount) AS Количество_экземпляров
-- FROM
--     book
-- GROUP BY
--     author;
--
-- SELECT
--     author,
--     MIN(price) AS Минимальная_цена,
--     MAX(price) AS Максимальная_цена,
--     AVG(price) AS Средняя_цена
-- FROM
--     book
-- GROUP BY
--     author;
--
-- SELECT
--     author,
--     ROUND(SUM(price * amount), 2) AS Стоимость,
--     ROUND(SUM(price * amount) * 18 / 118, 2) AS НДС,
--     ROUND(SUM(price * amount) / 1.18, 2) AS Стоимость_без_НДС
-- FROM
--     book
-- GROUP BY
--     author;
--
-- SELECT
--     ROUND(AVG(price), 2) AS Средняя_цена,
--     ROUND(SUM(price * amount), 2) AS Стоимость
-- FROM
--     book
-- WHERE
--     amount BETWEEN 5
--     AND 14;
--
-- SELECT
--     author,
--     ROUND(SUM(price * amount), 2) AS Стоимость
-- FROM
--     book
-- WHERE
--     title <> 'Идиот'
--     AND title <> 'Белая гвардия'
-- GROUP BY
--     author
-- HAVING
--     SUM(price * amount) > 5000
-- ORDER BY
--     Стоимость DESC;
--
-- SELECT
--     author,
--     title,
--     price
-- FROM
--     book
-- WHERE
--     price <= (
--         SELECT
--             AVG(price)
--         FROM
--             book
--     )
-- ORDER BY
--     price DESC;
-- SELECT
--     author,
--     title,
--     price
-- FROM
--     book
-- WHERE
--     price <= (
--         SELECT
--             MIN(price)
--         FROM
--             book
--     ) + 150
-- ORDER BY
--     price;
-- промежуточный запрос (вложенный)
-- SELECT
--     amount,
--     COUNT(amount)
-- FROM
--     book
-- GROUP BY
--     amount
-- HAVING
--     COUNT(amount) = 1;
--
-- SELECT
--     author,
--     title,
--     price
-- FROM
--     book
-- WHERE
--     price < ANY (
--         SELECT
--             MIN(price)
--         FROM
--             book
--         GROUP BY
--             author
--     );
--
-- SELECT
--     title,
--     author,
--     amount,
--     (
--         SELECT
--             MAX(amount)
--         FROM
--             book
--     ) - amount AS Заказ
-- FROM
--     book
-- WHERE
--     amount <> (
--         SELECT
--             MAX(amount)
--         FROM
--             book
--     );
--
-- CREATE TABLE supply(
--    supply_id INT PRIMARY KEY AUTO_INCREMENT,
--        title VARCHAR(50),
--       author VARCHAR(30),
--        price DECIMAL(8, 2),
--       amount INT
-- );
--
-- INSERT INTO
--     supply (title, author, price, amount)
-- VALUES
--     ('Лирика', 'Пастернак Б.Л.', 518.99, 2),
--     ('Черный человек', 'Есенин С.А.', 570.20, 6),
--     ('Белая гвардия', 'Булгаков М.А.', 540.50, 7),
--     ('Идиот', 'Достоевский Ф.М.', 360.80, 3);
-- SELECT
--     *
-- FROM
--     supply;
--
-- INSERT INTO
--     book (title, author, price, amount)
-- SELECT
--     title,
--     author,
--     price,
--     amount
-- FROM
--     supply
-- WHERE
--     author <> 'Достоевский Ф.М.'
--     and author <> 'Булгаков М.А.';
-- SELECT
--     *
-- FROM
--     book;
--
-- INSERT INTO book (title, author, price, amount) 
-- SELECT title, author, price, amount 
-- FROM supply
-- WHERE author NOT IN (
--         SELECT author 
--         FROM book
--       );
-- SELECT * FROM book;
--
-- UPDATE
--     book
-- SET
--     price = 0.9 * price
-- WHERE
--     amount BETWEEN 5
--     AND 10;
-- SELECT
--     *
-- FROM
--     book;
--
-- UPDATE
--     book
-- SET
--     buy = IF (amount < buy, amount, buy),
--     price = IF (buy = 0, price * 0.9, price);
-- SELECT
--     *
-- FROM
--     book;
--
-- UPDATE
--     book,
--     supply
-- SET
--     book.amount = book.amount + supply.amount,
--     book.price = (book.price + supply.price) / 2
-- WHERE
--     book.title = supply.title
--     AND book.author = supply.author;
-- SELECT
--     *
-- FROM
--     book;
--
-- DELETE FROM
--     supply
-- WHERE
--     author IN (
--         SELECT
--             author
--         FROM
--             book
--         GROUP BY
--             author
--         HAVING
--             SUM(amount) > 10
--     );
-- SELECT
--     *
-- FROM
--     supply;
--
-- CREATE TABLE ordering AS
-- SELECT
--     author,
--     title,
--     (
--         SELECT
--             ROUND(AVG(amount))
--         FROM
--             book
--     ) AS amount
-- FROM
--     book
-- WHERE
--     amount < (
--         SELECT
--             ROUND(AVG(amount))
--         FROM
--             book
--     );
-- SELECT
--     *
-- FROM
--     ordering;
--
-- CREATE TABLE author(
--     author_id INT PRIMARY KEY AUTO_INCREMENT,
--     name_author VARCHAR(50)
-- );
--
-- INSERT INTO
--     author (name_author)
-- VALUES
--     ('Булгаков М.А.'),
--     ('Достоевский Ф.М.'),
--     ('Есенин С.А.'),
--     ('Пастернак Б.Л.');
-- SELECT
--     *
-- FROM
--     author;
--
-- CREATE TABLE book (
--     book_id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(50),
--     author_id INT NOT NULL,
--     genre_id INT,
--     price DECIMAL(8, 2),
--     amount INT,
--     FOREIGN KEY (author_id) REFERENCES author (author_id),
--     FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
-- );
--
-- CREATE TABLE book (
--     book_id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(50),
--     author_id INT NOT NULL,
--     genre_id INT,
--     price DECIMAL(8, 2),
--     amount INT,
--     FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
--     FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE
--     SET
--         NULL
-- );
--
-- INSERT INTO
--     book(title, author_id, genre_id, price, amount)
-- VALUES
--     ('Стихотворения и поэмы', 3, 2, 650.00, 15),
--     ('Черный человек', 3, 2, 570.20, 6),
--     ('Лирика', 4, 2, 518.99, 2);
--
-- SELECT
--     title,
--     name_genre,
--     price
-- FROM
--     genre
--     INNER JOIN book ON genre.genre_id = book.genre_id
-- WHERE
--     amount > 8
-- ORDER BY
--     price DESC;
--
-- SELECT
--     name_genre
-- FROM
--     genre
--     LEFT JOIN book ON genre.genre_id = book.genre_id
-- WHERE
--     amount IS NULL;
--
-- SELECT
--     name_city,
--     name_author,
--     (
--         DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY)
--     ) as Дата
-- FROM
--     author,
--     city
-- ORDER BY
--     author ASC,
--     Дата DESC;
--
-- SELECT
--     name_genre,
--     title,
--     name_author
-- FROM
--     author
--     INNER JOIN book ON author.author_id = book.author_id
--     INNER JOIN genre ON genre.genre_id = book.genre_id
-- WHERE
--     name_genre = 'Роман'
-- ORDER BY
--     title;
--
-- SELECT
--     name_author,
--     SUM(amount) AS Количество
-- FROM
--     author
--     LEFT JOIN book on author.author_id = book.author_id
-- GROUP BY
--     name_author
-- HAVING
--     SUM(amount) < 10
--     OR Количество is NULL
-- ORDER BY
--     Количество;
--
SELECT
    name_author
FROM
    author
    INNER JOIN book on author.author_id = book.author_id
GROUP BY
    name_author
HAVING
    COUNT(DISTINCT genre_id) = 1;