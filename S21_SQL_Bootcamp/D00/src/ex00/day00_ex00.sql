/* Пожалуйста, составьте инструкцию SELECT, 
 * которая возвращает имена и возраст всех 
 * людей из города ‘Казань’.
 */
SELECT
    name,
    age
FROM
    person
WHERE
    address = 'Kazan';