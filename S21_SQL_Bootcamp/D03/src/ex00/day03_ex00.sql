WITH visits AS (
    SELECT
        pv.person_id,
        pv.pizzeria_id,
        pv.visit_date
    FROM
        person_visits pv
        JOIN (
            SELECT
                *
            FROM
                person
            WHERE
                person.name = 'Kate'
        ) q1 ON pv.person_id = q1.id
),
pizzerias AS (
    SELECT
        pz.id,
        pz.name,
        visits.visit_date
    FROM
        pizzeria pz
        JOIN visits ON pz.id = visits.pizzeria_id
),
prices AS (
    SELECT
        *
    FROM
        menu m
        JOIN pizzerias ON m.pizzeria_id = pizzerias.id
)
SELECT
    pr.pizza_name,
    pr.price,
    pr.name AS pizzeria_name,
    pr.visit_date
FROM
    prices pr
WHERE
    pr.price BETWEEN 800
    AND 1000
ORDER BY
    1,
    2,
    3,
    4;

/* Напишите SQL-запрос, который возвращает список названий 
 * пицц, цен на пиццу, названий пиццерий и дат посещения 
 * для Kate и цен от 800 до 1000 рублей. Выполните сортировку
 * по пицце, цене и названию пиццерии. Смотрите пример данных ниже.
 *
 * pizza_name	    price	pizzeria_name	visit_date
 * cheese pizza	    950	    DinoPizza	    2022-01-04
 * pepperoni pizza	800	    Best Pizza	    2022-01-03
 * pepperoni pizza	800	    DinoPizza	    2022-01-04
 * ...	            ...	    ...	            ...
 */
/* RESULT:
 * "pizza_name",        "price",    "pizzeria_name",    "visit_date"
 * "cheese pizza",      "950",      "DinoPizza",        "2022-01-04"
 * "pepperoni pizza",   "800",      "Best Pizza",       "2022-01-03"
 * "pepperoni pizza",   "800",      "DinoPizza",        "2022-01-04"
 * "sausage pizza",     "1000",     "DinoPizza",        "2022-01-04"
 * "supreme pizza",     "850",      "Best Pizza",       "2022-01-03"
 */