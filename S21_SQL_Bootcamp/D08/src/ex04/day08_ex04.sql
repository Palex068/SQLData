/* В этом задании описывается тот же порядок действий, 
 * что и в прошлом, но с уровнем изоляции SERIALIZABLE */
-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 1
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 2
-- UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
UPDATE
    pizzeria
SET
    rating = 3.0
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

/* По сравнению с выводом при REPEATABLE READ -
 * здесь ”Non-Repeatable Reads” не прослеживается.
 * Поскольку SERIALIZABLE максимально изолирует
 * транзакции друг от друга нока транзакция сессии 1 не
 * завершится, результат транзакции сессии 2 он не увидит */