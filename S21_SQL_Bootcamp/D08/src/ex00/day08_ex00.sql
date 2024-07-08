-- Session 1
/* 1. Начальное содержимое таблицы */
--
-- SELECT * FROM pizzeria;
--
SELECT
    *
FROM
    pizzeria;

--
/* 2. Начало транзакции */
--
BEGIN;

/* 3. Обновление табличных данных */
--
-- UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
--
UPDATE
    pizzeria
SET
    rating = 5
WHERE
    name = 'Pizza Hut';

--
/* 4. Таблица изменилась в текущей сессии */
--
-- SELECT * FROM pizzeria;
--
SELECT
    *
FROM
    pizzeria;

--
-- Session 2
/* 5. Во второй сессии данные не обновились,
 * так как транзакция ещё не завершена */
--
-- SELECT * FROM pizzeria;
--
SELECT
    *
FROM
    pizzeria;

--
-- Session 1
/* 6. Сохраним изменения, зафиксировав текущую транзакцию */
COMMIT;

--
-- SELECT * FROM pizzeria;
--
SELECT
    *
FROM
    pizzeria;

--
-- Session 2
/* 7. После фиксирования транзакции изменения видны
 * и во второй сессии*/
--
-- SELECT * FROM pizzeria;
--
SELECT
    *
FROM
    pizzeria;