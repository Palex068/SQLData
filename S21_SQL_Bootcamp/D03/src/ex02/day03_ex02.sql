SELECT
    m.pizza_name,
    m.price,
    pz.name AS pizzeria_name
FROM
    (
        SELECT
            id AS menu_id
        FROM
            menu
        EXCEPT
        SELECT
            menu_id
        FROM
            person_order
        ORDER BY
            menu_id
    ) AS request
    JOIN menu m ON request.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY
    1,
    2;

/* Используйте SQL-запрос из ex01 и выведите названия 
 * пицц из пиццерии, которые никто не заказывал, 
 * включая соответствующие цены. Результат должен быть 
 * отсортирован по названию пиццы и цене. Пример выходных 
 * данных приведен ниже.
 * pizza_name	    price	pizzeria_name
 * cheese pizza	    700	    Papa Johns
 * cheese pizza	    780	    DoDo Pizza
 * ...	            ...	    ...
 */
/* RESULT:
 * "pizza_name",    "price",    "pizzeria_name"
 * "cheese pizza",  "700",      "Papa Johns"
 * "cheese pizza",  "780",      "DoDo Pizza"
 * "cheese pizza",  "950",      "DinoPizza"
 * "sausage pizza", "950",      "Papa Johns"
 * "supreme pizza", "850",      "DoDo Pizza"
 */