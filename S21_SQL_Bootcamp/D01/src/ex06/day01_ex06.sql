SELECT
    visit_date AS action_date,
    (
        SELECT
            name
        FROM
            person
        WHERE
            person_visits.person_id = person.id
    ) AS person_name
FROM
    person_visits
INTERSECT
SELECT
    order_date AS action_date,
    (
        SELECT
            name
        FROM
            person
        WHERE
            person_order.person_id = person.id
    ) AS person_name
FROM
    person_order
ORDER BY
    action_date ASC,
    person_name DESC;

/*
 * Вернемся к ex03 и изменим наш SQL-запрос, чтобы он 
 * возвращал имена людей вместо id, и изменим сортировку 
 * по action_date в порядке возрастания, а затем по имени
 * человека в порядке убывания. Пример:
 * 
 * action_date	person_name
 * 2022-01-01	Irina
 * 2022-01-01	Anna
 * 2022-01-01	Andrey
 * ...	...
 */
/* RESULT:
 * "action_date","person_name"
 * "2022-01-01","Irina"
 * "2022-01-01","Anna"
 * "2022-01-01","Andrey"
 * "2022-01-03","Peter"
 * "2022-01-04","Kate"
 * "2022-01-05","Peter"
 * "2022-01-06","Nataly"
 * "2022-01-07","Nataly"
 * "2022-01-07","Denis"
 * "2022-01-08","Denis"
 * "2022-01-09","Elvira"
 * "2022-01-09","Dmitriy"
 * "2022-01-10","Dmitriy"
 */