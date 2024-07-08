INSERT INTO
    person_visits(id, person_id, pizzeria_id, visit_date)
VALUES
    (
        (
            SELECT
                max(id) + 1
            FROM
                person_visits
        ),
        (
            SELECT
                id
            FROM
                person
            WHERE
                name = 'Dmitriy'
        ),
        (
            SELECT
                pizzeria.id
            FROM
                pizzeria
                INNER JOIN menu m ON pizzeria.id = m.pizzeria_id
            WHERE
                price < 800
                AND m.pizza_name != 'Papa Johns'
            ORDER BY
                1
            LIMIT
                1
        ), '2022-01-08'
    );

REFRESH materialized view mv_dmitriy_visits_and_eats;

/* Давайте обновим данные в нашем материализованном 
 * представлении mv_dmitriy_visits_and_eats из ex06.
 * Перед выполнением этого действия, пожалуйста, создайте
 * еще один Dmitriy visit, который удовлетворяет условиям
 * SQL в материализованном представлении, за исключением
 * pizzeria, который мы видим в результате ex06. После
 * добавления нового посещения, пожалуйста, обновите
 * состояние данных для mv_dmitriy_visits_and_eats.
 */
select
    *
from
    mv_dmitriy_visits_and_eats;

/* RESULT:
 * "pizzeria_name"
 * "DoDo Pizza"
 * "Papa Johns"
 */