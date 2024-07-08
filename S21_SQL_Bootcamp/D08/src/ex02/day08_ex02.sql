-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

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

-- Session 1
-- UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
UPDATE
    pizzeria
SET
    rating = 4
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

-- Session 1
COMMIT;

/* В отличии от READ COMMITED после завершении транзакции
 * первой сессии попытка изменения того же кортежа,
 * заканчивается ошибкой */
-- Session 2
COMMIT;

-- Session 1
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 2
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';