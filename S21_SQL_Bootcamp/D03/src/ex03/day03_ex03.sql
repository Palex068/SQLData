WITH data AS (
    SELECT
        p.gender,
        pz.name
    FROM
        person p
        JOIN person_visits pv ON p.id = pv.person_id
        JOIN pizzeria pz on pv.pizzeria_id = pz.id
),
only_male AS (
    SELECT
        name
    FROM
        data
    WHERE
        gender = 'male'
),
only_female AS (
    SELECT
        name
    FROM
        data
    WHERE
        gender = 'female'
),
more_female AS (
    SELECT
        name
    FROM
        only_female
    EXCEPT
        ALL
    SELECT
        name
    FROM
        only_male
),
more_male AS (
    SELECT
        name
    FROM
        only_male
    EXCEPT
        ALL
    SELECT
        name
    FROM
        only_female
)
SELECT
    name AS pizzeria_name
FROM
    more_female
UNION
ALL
SELECT
    name AS pizzeria_name
FROM
    more_male
ORDER BY
    1;

/* Найдите пиццерии, которые чаще посещают женщины 
 * или мужчины. Сохраните дубликаты для любых SQL-запросов 
 * с параметром set (UNION ALL, EXCEPT ALL, INTERSECT ALL).
 * Отсортируйте результат по названию пиццерии. Примерные 
 * данные приведены ниже.
 * pizzeria_name
 * Best Pizza
 * Dominos
 * ...
 */
/* RESULT:
 * "pizzeria_name"
 * "Best Pizza"
 * "Dominos"
 * "Papa Johns"
 */