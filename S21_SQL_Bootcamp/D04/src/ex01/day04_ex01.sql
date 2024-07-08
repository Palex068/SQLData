SELECT
    name
FROM
    v_persons_female
UNION
SELECT
    name
FROM
    v_persons_male
ORDER BY
    1;

/* Пожалуйста, используйте 2 представления базы данных 
 * из ex00 и напишите SQL-запрос, чтобы получить женские 
 * и мужские имена в одном списке. Пожалуйста, отсортируйте 
 * результат по имени человека. Примеры данных приведены ниже.
 * name
 * Andrey
 * Anna
 * ...
 */
/* RESULT:
 * "name"
 * "Andrey"
 * "Anna"
 * "Denis"
 * "Dmitriy"
 * "Elvira"
 * "Irina"
 * "Kate"
 * "Nataly"
 * "Peter"
 */