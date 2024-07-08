SELECT
    COALESCE(person.name, '-') AS person_name,
    visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM
    person
    LEFT JOIN (
        SELECT
            *
        FROM
            person_visits
        WHERE
            visit_date BETWEEN '2022-01-01'
            AND '2022-01-03'
    ) AS pv ON person.id = pv.person_id FULL
    JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
ORDER BY
    person_name,
    visit_date,
    pizzeria_name;

/* Напишите SQL-запрос, который вернет весь список
 * имен людей, которые посещали (или не посещали) 
 * пиццерии в период с 1 по 3 января 2022 года, с 
 * одной стороны, и весь список названий пиццерий, 
 * которые были посещены (или не были посещены), 
 * с другой стороны. 
 * Ниже приведен пример данных с требуемыми названиями
 * столбцов. Пожалуйста, обратите внимание на замену 
 * нулевых значений "-" в столбцах person_name и 
 * pizzeria_name. Пожалуйста, также укажите порядок 
 * для всех 3 столбцов.
 *
 * person_name	visit_date	pizzeria_name
 *  -	        null	    DinoPizza
 *  -	        null	    DoDo Pizza
 *  Andrey	    2022-01-01	Dominos
 *  Andrey	    2022-01-02	Pizza Hut
 *  Anna	    2022-01-01	Pizza Hut
 *  Denis	    null	    -
 *  Dmitriy	    null	    -
 *  ...	        ...	        ...
 */
/* RESULT:
 * "person_name",   "visit_date",   "pizzeria_name"
 *   "-",           "NULL",         "DinoPizza"
 *   "-",           "NULL",         "DoDo Pizza"
 *   "Andrey",      "2022-01-01",   "Dominos"
 *   "Andrey",      "2022-01-02",   "Pizza Hut"
 *   "Anna",        "2022-01-01",   "Pizza Hut"
 *   "Denis",       "NULL",         "-"
 *   "Dmitriy",     "NULL",         "-"
 *   "Elvira",      "NULL",         "-"
 *   "Irina",       "2022-01-01",   "Papa Johns"
 *   "Kate",        "2022-01-03",   "Best Pizza"
 *   "Nataly",      "NULL",         "-"
 *   "Peter",       "2022-01-03",   "Pizza Hut"
 */