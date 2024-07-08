/*
 * Пожалуйста, составьте 2 инструкции SELECT 
 * с разным синтаксисом, которые возвращают 
 * список пиццерий (название пиццерии и рейтинг)
 * с рейтингом от 3,5 до 5 баллов (включая 
 * предельные баллы) и упорядоченных по рейтингу пиццерий.
 * первый оператор SELECT должен содержать 
 * знаки сравнения (<=, >=);
 */
SELECT
    name,
    rating
FROM
    pizzeria
WHERE
    rating >= 3.5
    AND rating <= 5
ORDER BY
    rating
    /* второй оператор SELECT должен содержать 
     * ключевое слово `BETWEEN`.
     */
SELECT
    name,
    rating
FROM
    pizzeria
WHERE
    rating BETWEEN 3.5
    AND 5
ORDER BY
    rating;