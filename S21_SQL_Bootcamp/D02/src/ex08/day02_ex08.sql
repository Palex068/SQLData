SELECT
    p.name
FROM
    person AS p
    INNER JOIN person_order po ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
WHERE
    p.gender = 'male'
    AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
    AND p.address IN ('Moscow', 'Samara')
ORDER BY
    1 DESC;

/* Найдите имена всех мужчин из Москвы или Самары, 
 * которые заказывают пиццу с пепперони или пиццу 
 * с грибами (или и то, и другое). Отсортируйте 
 * результат по именам в порядке убывания. Пример 
 * результатов приведен ниже.
 *  
 * name
 * Dmitriy
 * ...
 */
/* RESULT:
 * "name"
 * "Dmitriy"
 * "Andrey"
 */