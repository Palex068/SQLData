SELECT
    to_char(date, 'YYYY-MM-DD') AS missing_date
FROM
    GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') AS date
    LEFT JOIN(
        SELECT
            visit_date
        FROM
            person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS pv ON pv.visit_date = date
WHERE
    pv.visit_date IS NULL
ORDER BY
    missing_date;

/* Напишите SQL-запрос, который возвращает количество 
 * пропущенных дней с 1 по 10 января 2022 года (включая 
 * все дни) для посещений людьми с идентификаторами 1 
 * или 2 (т.е. дней, пропущенных обоими). Упорядочьте 
 * количество дней посещения по возрастанию. 
 * Ниже приведены примеры данных с названиями столбцов.
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