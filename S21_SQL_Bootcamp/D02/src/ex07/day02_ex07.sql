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

/* Пожалуйста, найдите название пиццерии, которую 
 * Дмитрий посетил 8 января 2022 года и где можно 
 * было отведать пиццу менее чем за 800 рублей.
 */
/* RESULT:
 * "pizzeria_name"
 * "Papa Johns"
 */