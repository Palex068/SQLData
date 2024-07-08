CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);

SET
  ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
  person_id,
  menu_id,
  order_date
FROM
  person_order
WHERE
  person_id = 8
  AND menu_id = 14;

-- SELECT *
-- FROM person_order
-- WHERE person_id = 8
--   AND menu_id = 14;
--
/* Пожалуйста, создайте лучший многоколоночный B-Tree index
 * с именем idx_person_order_multi для приведенной ниже
 * инструкции SQL.
 *
 * SELECT person_id, menu_id,order_date
 * FROM person_order
 * WHERE person_id = 8 AND menu_id = 19;
 *
 * Команда EXPLAIN ANALYZE должна вернуть следующий шаблон.
 * Пожалуйста, обратите внимание на сканирование "Только по индексу"!
 *
 * Index Only Scan using idx_person_order_multi on person_order ...
 *
 * Пожалуйста, предоставьте любой SQL-код с доказательством 
 * (EXPLAIN ANALYZE), что индекс idx_person_order_multi работает.
 */
/* RESULT:
 * "QUERY PLAN"
 * "Index Only Scan using idx_person_order_multi on person_order 
 * (cost=0.14..8.16 rows=1 width=20) (actual time=0.090..0.091 rows=1 loops=1)"
 * "  Index Cond: ((person_id = 8) AND (menu_id = 14))"
 * "  Heap Fetches: 1"
 * "Planning Time: 3.092 ms"
 * "Execution Time: 0.122 ms"
 */