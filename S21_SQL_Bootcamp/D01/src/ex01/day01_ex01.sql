SELECT
    object_name
FROM
    (
        SELECT
            name AS object_name
        FROM
            person
        ORDER BY
            object_name
    )
UNION
ALL
SELECT
    object_name
FROM
    (
        SELECT
            pizza_name AS object_name
        FROM
            menu
        ORDER BY
            object_name
    );

/*
 * Измените SQL-запрос из ex00, удалив столбец object_id. 
 * Затем измените сортировку по object_name для части 
 * данных из таблицы person, а затем из таблицы menu 
 * (как показано в примере ниже). 
 * Сохраните повторяющиеся данные!
 */
/* RESULT:
 * "object_name"
 * "Andrey"
 * "Anna"
 * "Denis"
 * "Dmitriy"
 * "Elvira"
 * "Irina"
 * "Kate"
 * "Nataly"
 * "Peter"
 * "cheese pizza"
 * "cheese pizza"
 * "cheese pizza"
 * "cheese pizza"
 * "cheese pizza"
 * "cheese pizza"
 * "mushroom pizza"
 * "mushroom pizza"
 * "pepperoni pizza"
 * "pepperoni pizza"
 * "pepperoni pizza"
 * "pepperoni pizza"
 * "sausage pizza"
 * "sausage pizza"
 * "sausage pizza"
 * "supreme pizza"
 * "supreme pizza"
 * "supreme pizza"
 */