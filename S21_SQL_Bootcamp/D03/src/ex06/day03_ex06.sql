SELECT
    menu1.pizza_name AS pizza_name,
    pizzeria1.name AS pizzeria_name_1,
    pizzeria2.name AS pizzeria_name_2,
    menu1.price AS price
FROM
    menu AS menu1
    INNER JOIN menu AS menu2 ON menu1.id <> menu2.id
    AND menu1.price = menu2.price
    AND menu1.pizza_name = menu2.pizza_name
    INNER JOIN pizzeria AS pizzeria2 ON pizzeria2.id = menu2.pizzeria_id
    INNER JOIN pizzeria AS pizzeria1 ON menu1.pizzeria_id = pizzeria1.id
WHERE
    pizzeria1.id > pizzeria2.id
ORDER BY
    pizza_name;

/* Найдите одинаковые названия пицц с одинаковой 
 * ценой, но из разных пиццерий. Убедитесь, что 
 * результат упорядочен по названию пиццы. Пример 
 * данных приведен ниже. Пожалуйста, убедитесь, 
 * что названия ваших столбцов совпадают с названиями
 * столбцов, приведенных ниже.
 * pizza_name	    pizzeria_name_1	    pizzeria_name_2	    price
 * cheese pizza	    Best Pizza	        Papa Johns	        700
 * ...	            ...	                ...	                ...
 */
/* RESULT:
 * "pizza_name",        "pizzeria_name_1",  "pizzeria_name_2",  "price"
 * "cheese pizza",      "Best Pizza",       "Papa Johns",       "700"
 * "pepperoni pizza",   "DinoPizza",        "Best Pizza",       "800"
 * "supreme pizza",     "Best Pizza",       "DoDo Pizza",       "850"
 */