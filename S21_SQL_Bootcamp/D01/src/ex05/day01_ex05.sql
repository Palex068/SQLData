SELECT
    person.id AS person_id,
    person.name AS person_name,
    person.age AS person_age,
    person.gender AS person_gender,
    person.address AS person_addres,
    pizzeria.id AS pizzeria_id,
    pizzeria.name AS pizzeria_name,
    pizzeria.rating AS pizzeria_rating
FROM
    person
    CROSS JOIN pizzeria
ORDER BY
    person.id,
    pizzeria.id;

/*
 * Напишите SQL-запрос, который возвращает все возможные
 * комбинации между таблицами person и pizzeria, и, сортировку
 * по person.id, а затем по pizzeria.id. 
 * Пример: 
 * person.id person.name age	gender	address	pizzeria.id	pizzeria.name	rating
 *      1	    Anna	  16	female	Moscow	    1	    Pizza Hut	    4.6
 *      1	    Anna	  16	female	Moscow	    2	    Dominos	        4.3
 *      ...	...	...	...	...	...	...	...
 */
/* RESULT:
 * "person_id","person_name","person_age","person_gender","person_addres","pizzeria_id","pizzeria_name","pizzeria_rating"
 * "1","Anna",16,"female","Moscow","1","Pizza Hut","4.6"
 * "1","Anna",16,"female","Moscow","2","Dominos","4.3"
 * "1","Anna",16,"female","Moscow","3","DoDo Pizza","3.2"
 * ...
 */