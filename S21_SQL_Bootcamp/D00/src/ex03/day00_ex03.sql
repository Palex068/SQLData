/*
 * Составьте запрос, в котором будут указаны 
 * идентификаторы пользователей
 * (без дублирования), которые посещали 
 * пиццерии в период с 6 по 9 января 2022 года
 * (включая все дни) или посещали пиццерии с
 * идентификатором 2. 
 * Также включите условие об сортировке по 
 * идентификатору пользователя по убыванию.
 */
SELECT
    DISTINCT person_id
FROM
    person_visits
WHERE
    visit_date BETWEEN '2022-01-06'
    AND '2022-01-09'
    OR pizzeria_id = 2
ORDER BY
    person_id DESC
    /*Альтернативный вариант*/
SELECT
    person_id
FROM
    person_visits
WHERE
    visit_date BETWEEN '2022-01-06'
    AND '2022-01-09'
    OR pizzeria_id = 2
GROUP BY
    person_id
ORDER BY
    person_id DESC;