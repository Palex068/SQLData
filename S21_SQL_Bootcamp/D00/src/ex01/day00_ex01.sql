/* Введите запрос SELECT, который вернет 
 * имена и возраст всех женщин из города
 * Казань. Да, и отсортируйте результат по имени.
 */
SELECT
    name,
    age
FROM
    person
WHERE
    address = 'Kazan'
    AND gender = 'female'
ORDER BY
    name;