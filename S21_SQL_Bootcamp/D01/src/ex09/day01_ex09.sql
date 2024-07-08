/*Вариант один*/
SELECT
    name
FROM
    pizzeria
WHERE
    id NOT IN(
        SELECT
            pizzeria_id
        FROM
            person_visits
    );

/* Вариант два*/
SELECT
    name
FROM
    pizzeria
WHERE
    NOT EXISTS(
        SELECT
            pizzeria_id
        FROM
            person_visits
        WHERE
            pizzeria.id = person_visits.pizzeria_id
    );

/* Напишите 2 SQL-запроса, которые возвращают список 
 * пиццерий, которые не посещались людьми, использующими
 * IN для первого и EXISTS для второго.*/
/* RESULT:
 * "name"
 * "DoDo Pizza"
 */