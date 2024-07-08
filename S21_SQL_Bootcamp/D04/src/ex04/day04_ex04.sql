CREATE
OR REPLACE view v_symmetric_union AS (
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-02'
    EXCEPT
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-06'
)
UNION
(
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-06'
    EXCEPT
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-02'
)
ORDER BY
    1;

/* Напишите инструкцию SQL, которая удовлетворяет
 * формуле (R - S)∪(S - R) . Где R - таблица 
 * person_visits с фильтром по 2 января 2022 года, 
 * S - также таблица person_visits, но с другим 
 * фильтром по 6 января 2022 года. Пожалуйста, 
 * выполните свои вычисления с наборами в столбце 
 * person_id, и этот столбец будет единственным в 
 * результате. Пожалуйста, отсортируйте результат 
 * по столбцу person_id и представьте свой окончательный
 * SQL-запрос в представлении базы данных v_symmetric_union (*).
 *
 * (*) Честно говоря, определения "симметричного 
 * объединения" в теории множеств не существует. 
 * Это авторская интерпретация, основная идея 
 * которой основана на существующем правиле 
 * симметричного различия.
 */
select
    *
from
    v_symmetric_union;

/* RESULT:
 * "person_id"
 * "2"
 * "8"
 */