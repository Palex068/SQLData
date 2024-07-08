CREATE
OR REPLACE view v_generated_dates AS
SELECT
    g :: date AS generated_date
FROM
    generate_series('2022-01-01', '2022-01-31', interval '1 day') as g
ORDER BY
    1;

/* Пожалуйста, создайте представление базы данных 
 * (с именем v_generated_dates), которое должно 
 * "хранить" сгенерированные даты с 1 по 31 января
 * 2022 года в типе DATE. Не забудьте отсортировать
 * по столбцу generated_data.
 */
select
    count(*) = 31 as check,
    min(generated_date) as check1,
    max(generated_date) as check2
from
    v_generated_dates;

/* RESULT:
 * "check", "check1",       "check2"
 * 1,       "2022-01-01",   "2022-01-31"
 */