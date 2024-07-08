CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET
  ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
  *
FROM
  menu
WHERE
  menu.pizzeria_id = 1
  AND menu.pizza_name = 'cheese pizza';

/* Пожалуйста, создайте уникальный BTree index с именем
 * idx_menu_unique в таблице меню для столбцов pizzeria_id
 * и pizza_name. Пожалуйста, напишите и предоставьте любой
 * SQL-код с доказательством (EXPLAIN ANALYZE), что index
 * idx_menu_unique работает.
 */
/* RESULT:
 * "QUERY PLAN"
 * "Index Scan using idx_menu_unique on menu 
 * (cost=0.14..8.16 rows=1 width=80)
 * (actual time=0.043..0.043 rows=1 loops=1)"
 * "  Index Cond: ((pizzeria_id = 1) AND
 * ((pizza_name)::text = 'cheese pizza'::text))"
 * "Planning Time: 1.483 ms"
 * "Execution Time: 0.066 ms"
 */