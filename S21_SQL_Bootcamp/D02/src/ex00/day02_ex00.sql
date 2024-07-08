SELECT
    pizzeria.name AS pizzeria_name,
    rating
FROM
    pizzeria
    LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE
    person_visits.id IS NULL;

/*
 * Напишите SQL-запрос, который возвращает список пиццерий с 
 * соответствующим значением рейтинга, которые еще не посещались людьми.
 */
/* RESULT:
 * "pizzeria_name","rating"
 * "DoDo Pizza","3.2"
 */