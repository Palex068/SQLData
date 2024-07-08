WITH data AS (
    SELECT
        p.gender,
        pz.name
    FROM
        person p
        JOIN person_order po on p.id = po.person_id
        JOIN menu m ON po.menu_id = m.id
        JOIN pizzeria pz on m.pizzeria_id = pz.id
),
male AS (
    SELECT
        name
    FROM
        data
    WHERE
        gender = 'male'
),
female AS (
    SELECT
        name
    FROM
        data
    WHERE
        gender = 'female'
)
SELECT
    name AS pizzeria_name
FROM
    female
EXCEPT
SELECT
    name AS pizzeria_name
FROM
    male;

/*Найдите объединение пиццерий, которые принимают заказы 
 * как от женщин, так и от мужчин. Другими словами, вы 
 * должны найти набор названий пиццерий, которые заказывали 
 * только женщины, и выполнить операцию "UNION" с набором 
 * названий пиццерий, которые заказывали только мужчины. 
 * Пожалуйста, будьте осторожны со словом "only" для обоих 
 * полов. Для всех SQL-операторов с sets не сохраняются 
 * дубликаты (UNION, EXCEPT, INTERSECT). Отсортируйте 
 * результат по названию пиццерии. Пример данных приведен ниже.
 * 
 * pizzeria_name
 * Papa Johns
 */
/* RESULT:
 * "pizzeria_name"
 * "Papa Johns"
 */