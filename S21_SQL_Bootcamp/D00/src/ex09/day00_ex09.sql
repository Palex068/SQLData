/*
 * Сделайте запрос, который возвращает имена посетителей и 
 * названия пиццерий на основе таблицы person_visits с 
 * указанием даты посещения в период с 07 по 09 января 2022 
 * года (включая все дни) (на основе внутреннего запроса 
 * в разделе "FROM").
 * 
 * Обратите внимание на структуру окончательного запроса.
 * 
 *    SELECT
 *        (...) AS person_name,
 *        -- this is an internal query in a main 
 *        -- SELECT clause
 *        (...) AS pizzeria_name 
 *        -- this is an internal query in a main 
 *        -- SELECT clause
 *    FROM
 *        (
 *            SELECT
 *                …
 *            FROM
 *                person_visits
 *            WHERE
 *                …
 *        ) AS pv 
 *          -- this is an internal query in a 
 *          -- main FROM clause
 *    ORDER BY ...
 * 
 * Добавьте сортировку по имени пользователя в порядке 
 * возрастания и по названию пиццерии в порядке убывания.
 */
SELECT
    (
        SELECT
            name
        FROM
            person
        WHERE
            person.id = pv.person_id
    ) AS person_name,
    (
        SELECT
            name
        FROM
            pizzeria
        WHERE
            pizzeria.id = pv.pizzeria_id
    ) AS pizzeria_name
FROM
    (
        SELECT
            *
        FROM
            person_visits pv
        WHERE
            visit_date BETWEEN '2022-01-07'
            and '2022-01-09'
    ) AS pv
ORDER BY
    person_name ASC,
    pizzeria_name DESC;