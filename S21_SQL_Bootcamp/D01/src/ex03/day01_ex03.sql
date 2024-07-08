SELECT
    visit_date AS action_date,
    person_id
FROM
    person_visits
INTERSECT
SELECT
    order_date AS action_date,
    person_id
FROM
    person_order
ORDER BY
    action_date ASC,
    person_id DESC;

/*
 * Напишите SQL-запрос, который возвращает общие строки
 * для атрибутов order_date, person_id из таблицы 
 * person_order с одной стороны и visit_date, person_id 
 * из таблицы person_visits с другой стороны. 
 * Другими словами, давайте найдем идентификаторы людей, 
 * которые посетили пиццу и заказали ее в один и тот же 
 * день. Отсортируйте по action_date в порядке возрастания, 
 * а затем по person_id в порядке убывания.
 */
/* RESULT:
 * "action_date","person_id"
 * "2022-01-01","6"
 * "2022-01-01","2"
 * "2022-01-01","1"
 * "2022-01-03","7"
 * "2022-01-04","3"
 * "2022-01-05","7"
 * "2022-01-06","8"
 * "2022-01-07","8"
 * "2022-01-07","4"
 * "2022-01-08","4"
 * "2022-01-09","9"
 * "2022-01-09","5"
 * "2022-01-10","9"
 */