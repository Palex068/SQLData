WITH data AS (
    SELECT
        p.name,
        pz.name AS pizzeria_name,
        pv.visit_date,
        po.order_date,
        po.menu_id
    FROM
        (
            SELECT
                id,
                name
            FROM
                person
            WHERE
                name = 'Andrey'
        ) AS p
        JOIN person_visits pv ON p.id = pv.person_id
        JOIN pizzeria pz ON pv.pizzeria_id = pz.id
        JOIN person_order po ON p.id = po.person_id
)
SELECT
    DISTINCT pizzeria_name
FROM
    data
WHERE
    visit_date != order_date;

/* Напишите SQL-запрос, который возвращает список 
 * пиццерий, которые Андрей посещал, но в которых 
 * не делал заказов. Отсортируйте по названию пиццерии. 
 * Примерные данные приведены ниже.
 * pizzeria_name
 * Pizza Hut
 */
/* RESULT:
 * "pizzeria_name"
 * "Pizza Hut"
 */