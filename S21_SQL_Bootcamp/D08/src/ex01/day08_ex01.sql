/* 1. Проверим уровень изоляции транзакций */
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
/* 2. Начало транзакции 1*/
BEGIN;

-- Session 2
/* 3. Начало транзакции 2*/
BEGIN;

-- Session 1
/* 4. Вывод текущего кортежа */
--
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 2
/* 5. Вывод текущего кортежа */
--
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 1
/* 6. Обновление данных */
-- UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
--
UPDATE
    pizzeria
SET
    rating = 4
WHERE
    name = 'Pizza Hut';

-- Session 2
/* 7. Обновление данных второй  сессии сопровождается 
 * ожиданием окончания транзакции первой сессии */
--
-- UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
--
UPDATE
    pizzeria
SET
    rating = 3.6
WHERE
    name = 'Pizza Hut';

-- Session 1
/* 8. Кортеж обновился в текущей сессии */
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

/* 9. Завершим транзакцию первой сессии */
COMMIT;

-- Session 2
/* 10. По завершению транзакции первой сессии
 * изменились данные во второй */
--
-- Session 1
/* 11. Посмотрим вывод кортежа первой сессии. Пока рейтинг 4.0 */
--
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 2
/* 12. Во второй сессии рейтинг изменился на 3.6 */
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

--
/* 13. Зафиксируем изменения */
--
COMMIT;

/* 14. Теперь рейтинг 3.6 согласно последней фиксации */
--SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Session 1
/* 15. В первой сессии - аналогично */
-- SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

/* Вывод: при последовательной фиксации двух транзакций, 
 * изменения первой транзакции будут утеряны из-за 
 * перезаписи их второй транзакцией */