SELECT
    pizza_name
FROM
    menu
UNION
SELECT
    pizza_name
FROM
    menu
ORDER BY
    pizza_name;

/*
 * Напишите SQL-запрос, который возвращает уникальные
 * названия пицц из таблицы menu и сортирует их по 
 * столбцу pizza_name в порядке убывания.
 * Не использовать: 
 * DISTINCT, GROUP BY, HAVING, any type of JOINs
 */
/* RESULT:
 * "pizza_name"
 * "cheese pizza"
 * "mushroom pizza"
 * "pepperoni pizza"
 * "sausage pizza"
 * "supreme pizza"
 */