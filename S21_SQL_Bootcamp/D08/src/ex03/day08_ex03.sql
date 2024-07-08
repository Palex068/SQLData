/* Зная из прошлых заданий с уровнем изоляции
 * READ COMMITED о принципе его работы, данный
 * пример является простым примером определенного
 * частного случая выходящего из логики работы
 * данного уровня изоляции*/
--
-- Session 1
BEGIN;

-- Session 2
BEGIN;

SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 2
-- UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
UPDATE
    pizzeria
SET
    rating = 3.6
WHERE
    name = 'Pizza Hut';

COMMIT;

-- Session 1
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

COMMIT;

-- Session 1
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 2
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

/* Аномалия “Non-Repeatable Reads“ показывает, что в
 первой сессии в рамках одной транзакции мы можем
 на выводе кортежа наблюдать различные выводы,
 поскольку между ними на стороне может завершиться
 транзакция второй сессии */