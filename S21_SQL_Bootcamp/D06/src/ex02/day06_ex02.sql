SELECT
    p.name,
    m.pizza_name,
    m.price,
    m.price - ROUND((m.price * pd.discount) / 100, 2) AS discount_price,
    pz.name AS pizzeria_name
FROM
    person_order po
    JOIN person p ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_discounts pd ON (
        po.person_id = pd.person_id
        AND pz.id = pd.pizzeria_id
    )
ORDER BY
    1,
    2;

/* Пожалуйста, напишите SQL-запрос, который возвращает заказы
 * с актуальной ценой и ценой с примененной скидкой для каждого
 * человека в соответствующей пиццерии-ресторане и сортирует
 * по имени человека и названию пиццы. Пожалуйста, взгляните
 * на образец данных, приведенный ниже.
 * name	    pizza_name	    price	discount_price	pizzeria_name
 * Andrey	cheese pizza	800	    624	            Dominos
 * Andrey	mushroom pizza	1100	858	            Dominos
 * ...	    ...	            ...	    ...	            ...
 */
/* RESULT:
 * "name",      "pizza_name",       "price", "discount_price",  "pizzeria_name"
 * "Andrey",    "cheese pizza",     "800",   "624.00",          "Dominos"
 * "Andrey",    "mushroom pizza",   "1100",  "858.00",          "Dominos"
 * "Anna",      "cheese pizza",     "900",   "702.00",          "Pizza Hut"
 * "Anna",      "pepperoni pizza",  "1200",  "936.00",          "Pizza Hut"
 * "Denis",     "cheese pizza",     "700",   "490.00",          "Best Pizza"
 * "Denis",     "pepperoni pizza",  "800",   "560.00",          "Best Pizza"
 * "Denis",     "pepperoni pizza",  "800",   "624.00",          "DinoPizza"
 * "Denis",     "sausage pizza",    "1000",  "780.00",          "DinoPizza"
 * "Denis",     "sicilian pizza",   "900",   "805.50",          "Dominos"
 * "Denis",     "supreme pizza",    "850",   "595.00",          "Best Pizza"
 * "Dmitriy",   "pepperoni pizza",  "800",   "716.00",          "DinoPizza"
 * "Dmitriy",   "supreme pizza",    "850",   "760.75",          "Best Pizza"
 * "Elvira",    "pepperoni pizza",  "800",   "624.00",          "DinoPizza"
 * "Elvira",    "sausage pizza",    "1000",  "780.00",          "DinoPizza"
 * "Irina",     "mushroom pizza",   "950",   "850.25",          "Papa Johns"
 * "Irina",     "sicilian pizza",   "900",   "805.50",          "Dominos"
 * "Kate",      "cheese pizza",     "700",   "626.50",          "Best Pizza"
 * "Nataly",    "cheese pizza",     "800",   "716.00",          "Dominos"
 * "Nataly",    "pepperoni pizza",  "1000",  "895.00",          "Papa Johns"
 * "Peter",     "mushroom pizza",   "1100",  "984.50",          "Dominos"
 * "Peter",     "sausage pizza",    "1200",  "936.00",          "Pizza Hut"
 * "Peter",     "supreme pizza",    "1200",  "936.00",          "Pizza Hut"
 */