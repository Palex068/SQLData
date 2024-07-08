SELECT
    pizza_name,
    name AS pizzeria_name,
    price
FROM
    menu
    INNER JOIN pizzeria p ON menu.pizzeria_id = p.id
WHERE
    pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY
    pizza_name,
    pizzeria_name;

/* Найдите полную информацию о всех возможных названиях
 * пиццерий и ценах, чтобы заказать пиццу с грибами или 
 * пепперони. Затем отсортируйте результат по названию 
 * пиццы и пиццерии. Ниже приведен результат выборки 
 * данных (пожалуйста, используйте те же названия 
 * столбцов в вашем SQL-запросе).
 *
 * pizza_name	    pizzeria_name	price
 * mushroom pizza	Dominos	        1100
 * mushroom pizza	Papa Johns	    950
 * pepperoni pizza	Best Pizza	    800
 * ...	...	...
 */
/* RESULT:
 * "pizza_name","pizzeria_name","price"
 * "mushroom pizza","Dominos","1100"
 * "mushroom pizza","Papa Johns","950"
 * "pepperoni pizza","Best Pizza","800"
 * "pepperoni pizza","DinoPizza","800"
 * "pepperoni pizza","Papa Johns","1000"
 * "pepperoni pizza","Pizza Hut","1200"
 */