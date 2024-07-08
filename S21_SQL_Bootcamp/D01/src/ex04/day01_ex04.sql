SELECT
    person_id
FROM
    person_order
WHERE
    order_date = '2022-01-07'
EXCEPT
    ALL
SELECT
    person_id
FROM
    person_visits
WHERE
    visit_date = '2022-01-07';

/*
 * Напишите SQL-запрос, который возвращает разницу 
 * (минус) значений столбца person_id при сохранении
 * дубликатов между таблицей person_order и таблицей
 * person_visits для order_date и visit_date для 7 
 * января 2022 года.
 */
/* RESULT:
 * "person_id"
 * "4"
 * "4"
 */