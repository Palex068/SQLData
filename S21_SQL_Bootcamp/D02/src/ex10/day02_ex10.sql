SELECT
    p1.name AS person_name1,
    p2.name AS person_name2,
    p1.address AS common_address
FROM
    person p1
    INNER JOIN person p2 ON p1.id > p2.id
    AND p1.address = p2.address
order by
    1,
    2,
    3;

/* Найдите имена людей, живущих по одному и тому 
 * же адресу. Убедитесь, что результат отсортирован 
 * по имени 1-го человека, имени 2-го человека и 
 * общему адресу. Пример данных приведен ниже. 
 * Убедитесь, что названия ваших столбцов совпадают 
 * с названиями столбцов, приведенными ниже.
 * person_name1	    person_name2	common_address
 * Andrey	        Anna	        Moscow
 * Denis	        Kate	        Kazan
 * Elvira	        Denis	        Kazan
 * ...	            ...	            ...
 */
/* RESULT:
 * "person_name1",      "person_name2",     "common_address"
 * "Andrey",            "Anna",             "Moscow"
 * "Denis",             "Kate",             "Kazan"
 * "Elvira",            "Denis",            "Kazan"
 * "Elvira",            "Kate",             "Kazan"
 * "Peter",             "Irina",            "Saint-Petersburg"
 */