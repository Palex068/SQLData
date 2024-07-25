SELECT
    generated_date as missing_data
FROM
    v_generated_dates
EXCEPT
SELECT
    visit_date
FROM
    person_visits
ORDER BY
    1;

/* Напишите SQL-запрос, который возвращает пропущенные 
 * дни для посещений пользователей в январе 2022 года. 
 * Используйте для этой задачи представление v_generated_dates 
 * и отсортируйте результат по столбцу missing_data. 
 * Пример данных показан ниже.
 * missing_date
 * 2022-01-11
 * 2022-01-12
 * ...
 */
/* RESULT:
 * "missing_data"
 * "2022-01-11"
 * "2022-01-12"
 * "2022-01-13"
 * "2022-01-14"
 * "2022-01-15"
 * "2022-01-16"
 * "2022-01-17"
 * "2022-01-18"
 * "2022-01-19"
 * "2022-01-20"
 * "2022-01-21"
 * "2022-01-22"
 * "2022-01-23"
 * "2022-01-24"
 * "2022-01-25"
 * "2022-01-26"
 * "2022-01-27"
 * "2022-01-28"
 * "2022-01-29"
 * "2022-01-30"
 * "2022-01-31"
 */