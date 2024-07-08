SELECT
    name
FROM
    person
WHERE
    gender = 'female'
    AND age > 25
ORDER BY
    name;

/* Найдите имена всех женщин старше 25 лет и отсортируйте 
 * результат по имени. Пример выходных данных приведен ниже.
 * 
 * name
 * Elvira
 * ...
 */
/* RESULT:
 * "name"
 * "Elvira"
 * "Kate"
 * "Nataly"
 */