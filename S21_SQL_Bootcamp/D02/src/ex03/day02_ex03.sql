WITH cte AS (
    SELECT
        cte :: date
    FROM
        generate_series('2022-01-01', '2022-01-10', interval '1 day') as cte
)
SELECT
    cte :: date AS missing_date
FROM
    (
        SELECT
            *
        FROM
            person_visits po
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS po
    RIGHT JOIN cte AS cte ON po.visit_date = cte
WHERE
    po.id IS NULL
ORDER BY
    1;

/* Давайте вернемся к ex01, перепишите ваш SQL-запрос, 
 * используя шаблон CTE (Common Table Expression). 
 * Перейдите к разделу CTE вашего "генератора дней". 
 * Результат должен выглядеть аналогично ex01.
 * 
 * missing_date
 * 2022-01-03
 * 2022-01-04
 * 2022-01-05
 */
/* RESULT:
 * "missing_date"
 * "2022-01-03"
 * "2022-01-04"
 * "2022-01-05"
 * "2022-01-06"
 * "2022-01-07"
 * "2022-01-08"
 * "2022-01-09"
 * "2022-01-10"
 */