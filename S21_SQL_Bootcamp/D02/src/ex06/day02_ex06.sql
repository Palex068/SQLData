SELECT
    m.pizza_name,
    pz.name AS pizzeria_name
FROM
    person_order AS po
    INNER JOIN person p ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE
    p.name IN ('Denis', 'Anna')
ORDER BY
    1,
    2;

/* Найдите в таблице меню все названия пиццерий, которые 
 * заказывал Денис или Анна. Отсортируйте результат по 
 * обоим столбцам. Пример выходных данных приведен ниже.
 */
/* RESULT:
 * "pizza_name","pizzeria_name"
 * "cheese pizza","Best Pizza"
 * "cheese pizza","Pizza Hut"
 * "pepperoni pizza","Best Pizza"
 * "pepperoni pizza","DinoPizza"
 * "pepperoni pizza","Pizza Hut"
 * "sausage pizza","DinoPizza"
 * "supreme pizza","Best Pizza"
 */