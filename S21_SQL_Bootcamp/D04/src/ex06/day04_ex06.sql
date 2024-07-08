CREATE materialized VIEW mv_dmitriy_visits_and_eats AS
SELECT
    pz.name AS pizzeria_name
FROM
    person_visits AS pv
    INNER JOIN person p ON p.id = pv.person_id
    INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    INNER JOIN menu m ON m.pizzeria_id = pz.id
WHERE
    m.price < 800
    AND p.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08';

/* Пожалуйста, создайте материализованное представление 
 * mv_dmitriy_visits_and_eats (с включенными данными)
 * на основе инструкции SQL, которая находит название
 * пиццерии, которую Дмитрий посетил 8 января 2022 года
 * и где он мог съесть пиццу менее чем за 800 рублей
 * (этот SQL можно найти в ex07 "Day 02").
 *
 * Чтобы проверить себя, вы можете записать SQL в
 * материализованное представление mv_dmitriy_visits_and_eats
 * и сравнить результаты с вашим предыдущим запросом.
 */
SELECT
    pz.name AS pizzeria_name
FROM
    person_visits AS pv
    INNER JOIN person p ON p.id = pv.person_id
    INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    INNER JOIN menu m ON m.pizzeria_id = pz.id
WHERE
    m.price < 800
    AND p.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08';

/* Check*/
select
    *
from
    mv_dmitriy_visits_and_eats;

/* RESULT:
 * "pizzeria_name"
 * "Papa Johns"
 */