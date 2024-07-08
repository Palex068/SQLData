CREATE
OR REPLACE view v_price_with_discount AS
SELECT
    p.name,
    m.pizza_name,
    m.price,
    round(m.price * 0.9) AS discount_price
FROM
    person_order po
    JOIN person p ON p.id = po.person_id
    JOIN menu m ON m.id = po.menu_id
ORDER BY
    p.name,
    m.pizza_name;

/* Пожалуйста, создайте представление базы данных
 * v_price_with_discount, которое возвращает заказы
 * пользователя с указанием имени пользователя,
 * названия пиццы, реальной цены и рассчитанного
 * столбца discount_price (с примененной скидкой 
 * 10% и соответствующей формулой price - цена*0,1).
 * Пожалуйста, отсортируйте результат по именам
 * посетителей и названиям пицц и преобразуйте
 * столбец discount_price в целое число. Смотрите
 * пример результата ниже.
 * name	    pizza_name	    price	discount_price
 * Andrey	cheese pizza	800	    720
 * Andrey	mushroom pizza	1100	990
 * ...	    ...	            ...	    ...
 */
select
    *
from
    v_price_with_discount;

/* RESULT:
 * "name",      "pizza_name",       "price",    "discount_price"
 * "Andrey",    "cheese pizza",     "800",      "720"
 * "Andrey",    "mushroom pizza",   "1100",     "990"
 * "Anna",      "cheese pizza",     "900",      "810"
 * "Anna",      "pepperoni pizza",  "1200",     "1080"
 * "Denis",     "cheese pizza",     "700",      "630"
 * "Denis",     "pepperoni pizza",  "800",      "720"
 * "Denis",     "pepperoni pizza",  "800",      "720"
 * "Denis",     "sausage pizza",    "1000",     "900"
 * "Denis",     "sicilian pizza",   "900",      "810"
 * "Denis",     "supreme pizza",    "850",      "765"
 * "Dmitriy",   "pepperoni pizza",  "800",      "720"
 * "Dmitriy",   "supreme pizza",    "850",      "765"
 * "Elvira",    "pepperoni pizza",  "800",      "720"
 * "Elvira",    "sausage pizza",    "1000",     "900"
 * "Irina",     "mushroom pizza",   "950",      "855"
 * "Irina",     "sicilian pizza",   "900",      "810"
 * "Kate",      "cheese pizza",     "700",      "630"
 * "Nataly",    "cheese pizza",     "800",      "720"
 * "Nataly",    "pepperoni pizza",  "1000",     "900"
 * "Peter",     "mushroom pizza",   "1100",     "990"
 * "Peter",     "sausage pizza",    "1200",     "1080"
 * "Peter",     "supreme pizza",    "1200",     "1080"
 */