/*
 * Напишите запрос, который возвращает имена людей 
 * (на основе внутреннего запроса), которые размещали
 * заказы на меню с идентификаторами 13, 14 и 18,
 * и датой заказа должно быть 7 января 2022 года.
 */
SELECT
    (
        SELECT
            name
        FROM
            person
        WHERE
            person.id = person_order.person_id
    ) AS name
FROM
    person_order
WHERE
    (
        menu_id = 13
        OR menu_id = 14
        OR menu_id = 18
    )
    AND order_date = '2022-01-07';