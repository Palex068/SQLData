SELECT
    person.name AS person_name,
    pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY
    person.name,
    pizza_name,
    pizzeria.name;

/* Напишите SQL-запрос, который возвращает список имен 
 * людей, заказавших пиццу в соответствующей пиццерии. 
 * Пример результата (с именованными столбцами) приведен
 * ниже и оформляйте заказ по 3 столбцам  (person_name, 
 * pizza_name, pizzeria_name) в порядке возрастания.
 */
/* RESULT:
 * "person_name","pizza_name","pizzeria_name"
 * "Andrey","cheese pizza","Dominos"
 * "Andrey","mushroom pizza","Dominos"
 * "Anna","cheese pizza","Pizza Hut"
 * "Anna","pepperoni pizza","Pizza Hut"
 * "Denis","cheese pizza","Best Pizza"
 * "Denis","pepperoni pizza","Best Pizza"
 * "Denis","pepperoni pizza","DinoPizza"
 * "Denis","sausage pizza","DinoPizza"
 * "Denis","supreme pizza","Best Pizza"
 * "Dmitriy","pepperoni pizza","DinoPizza"
 * "Dmitriy","supreme pizza","Best Pizza"
 * "Elvira","pepperoni pizza","DinoPizza"
 * "Elvira","sausage pizza","DinoPizza"
 * "Irina","mushroom pizza","Papa Johns"
 * "Kate","cheese pizza","Best Pizza"
 * "Nataly","cheese pizza","Dominos"
 * "Nataly","pepperoni pizza","Papa Johns"
 * "Peter","mushroom pizza","Dominos"
 * "Peter","sausage pizza","Pizza Hut"
 * "Peter","supreme pizza","Pizza Hut"
 */