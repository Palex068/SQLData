CREATE INDEX idx_person_name ON person ((UPPER(name)));

SET
    ENABLE_SEQSCAN TO OFF;

SELECT
    *
FROM
    person p
WHERE
    UPPER(p.name) = 'ANNA';

EXPLAIN ANALYZE
SELECT
    *
FROM
    person p
WHERE
    UPPER(p.name) = 'ANNA';

/* Пожалуйста, создайте функциональный B-Tree index с именем
 * idx_person_name для имени столбца таблицы person. Индекс
 * должен содержать имена пользователей в верхнем регистре.
 * Пожалуйста, напишите и предоставьте любой SQL-код с
 * доказательством (EXPLAIN ANALYZE), что индекс idx_person_name
 * работает.
 */
--
/* RESULT:
 * "id",    "name",     "age",  "gender",   "address"
 * "1",     "Anna",     16,     "female",   "Moscow"
 */
--
/* "QUERY PLAN"
 * "Index Scan using idx_person_name on person p 
 * (cost=0.14..8.15 rows=1 width=108)
 * (actual time=0.005..0.005 rows=1 loops=1)"
 * "  Index Cond: (upper((name)::text) = 'ANNA'::text)"
 * "Planning Time: 0.030 ms"
 * "Execution Time: 0.012 ms"
 */