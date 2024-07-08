/* В принципе суть ”phantom reads” та же, что и у
 * “Non-RepeatabIe Reads” поскольку базируются
 * они на одном и том же недостатке уровня
 * изоляции READ СОММТТ */
--
-- Session 1
BEGIN;

-- Session 2
BEGIN;

SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
-- SELECT SUM(rating) FROM pizzeria;
SELECT
    SUM(rating)
FROM
    pizzeria;

-- Session 2
-- INSERT INTO pizzeria VALUES (10,'Kazan Pizza', 5.0);
INSERT INTO
    pizzeria
VALUES
    (10, 'Kazan Pizza', 5.0);

COMMIT;

-- Session 1
-- SELECT SUM(rating) FROM pizzeria;
SELECT
    SUM(rating)
FROM
    pizzeria;

COMMIT;

-- Session 1
-- SELECT SUM(rating) FROM pizzeria;
SELECT
    SUM(rating)
FROM
    pizzeria;

-- Session 2
-- SELECT SUM(rating) FROM pizzeria;
SELECT
    SUM(rating)
FROM
    pizzeria;

/* В итоге в рамках одной транзакции в первой сессии можно
 * увидеть, что набор выдаваемых строк до завершения
 * транзакции второй сессии и после различаются */