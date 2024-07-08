SELECT
    p.name
FROM
    person AS p
    INNER JOIN person_order po ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
WHERE
    p.gender = 'female'
    AND m.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT
    p.name
FROM
    person AS p
    INNER JOIN person_order po ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
WHERE
    p.gender = 'female'
    AND m.pizza_name = 'cheese pizza'
ORDER BY
    name;

/* Найдите имена всех женщин, которые заказывали пиццу 
 * с пепперони и сыром (в любое время и в любых пиццериях). 
 * Убедитесь, что результат отсортирован по имени человека. 
 * Ниже приведены примерные данные.
 *  
 * name
 * Anna
 * ...
 */
/* RESULT:
 * "name"
 * "Anna"
 * "Nataly"
 */