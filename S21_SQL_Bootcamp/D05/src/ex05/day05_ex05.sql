CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE
  order_date = '2022-01-01';

SET
  ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
  po.person_id,
  po.menu_id
FROM
  person_order po
WHERE
  po.person_id = 1
  AND po.menu_id = 1
  AND po.order_date = '2022-01-01';

/* Пожалуйста, создайте частично уникальный BTree index с
 * именем idx_person_order_order_date в таблице person_order
 * для атрибутов person_id и menu_id с частичной уникальностью
 * для столбца order_date для даты ‘2022-01-01’.
 *
 * Команда EXPLAIN ANALYZE должна вернуть следующий шаблон
 *
 * Index Only Scan using idx_person_order_order_date on person_order …
 */
/* RESULT:
 * "QUERY PLAN"
 * "Index Only Scan using idx_person_order_order_date on
 * person_order po  (cost=0.13..8.15 rows=1 width=16)
 * (actual time=0.077..0.078 rows=1 loops=1)"
 * "  Index Cond: ((person_id = 1) AND (menu_id = 1))"
 * "  Heap Fetches: 1"
 * "Planning Time: 2.143 ms"
 * "Execution Time: 0.098 ms"
 */