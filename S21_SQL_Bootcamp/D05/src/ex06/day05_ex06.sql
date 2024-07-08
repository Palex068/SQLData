DROP INDEX idx_1;

SET
    ENABLE_SEQSCAN TO ON;

EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    MAX(rating) OVER (
        PARTITION BY rating
        ORDER BY
            rating ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
    ) AS k
FROM
    menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY
    1,
    2;

CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);

SET
    ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    MAX(rating) OVER (
        PARTITION BY rating
        ORDER BY
            rating ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
    ) AS k
FROM
    menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY
    1,
    2;

-- 
/* Пожалуйста, взгляните на приведенный ниже SQL с
 * технической точки зрения (не обращайте внимания 
 * на логический пример этого оператора SQL).
 *
 * SELECT
 *     m.pizza_name AS pizza_name,
 *     max(rating) OVER (PARTITION BY rating 
 *     ORDER BY 
 rating ROWS BETWEEN UNBOUNDED PRECEDING
 AND UNBOUNDED FOLLOWING) AS k
 * FROM  menu m
 * INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
 * ORDER BY 1,2;
 *
 * Создайте новый BTree index с именем idx_1, который
 * должен улучшить показатель “Время выполнения” этого SQL.
 * Пожалуйста, предоставьте доказательства (EXPLAIN ANALYZE)
 * того, что SQL был улучшен.
 *
 * Подсказка: это упражнение похоже на задачу “brute force”,
 * чтобы найти хороший индекс покрытия, поэтому перед новым
 * тестированием удалите индекс idx_1.
 *
 */
/* "QUERY PLAN"
 "Sort  (cost=3.57..3.62 rows=19 width=96) (actual time=0.137..0.138 rows=19 loops=1)"
 "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
 "  Sort Method: quicksort  Memory: 26kB"
 "  ->  WindowAgg  (cost=2.79..3.17 rows=19 width=96) (actual time=0.076..0.087 rows=19 loops=1)"
 "        ->  Sort  (cost=2.79..2.84 rows=19 width=64) (actual time=0.063..0.064 rows=19 loops=1)"
 "              Sort Key: pz.rating"
 "              Sort Method: quicksort  Memory: 25kB"
 "              ->  Hash Join  (cost=1.14..2.39 rows=19 width=64) (actual time=0.045..0.050 rows=19 loops=1)"
 "                    Hash Cond: (m.pizzeria_id = pz.id)"
 "                    ->  Seq Scan on menu m  (cost=0.00..1.19 rows=19 width=40) (actual time=0.012..0.013 rows=19 loops=1)"
 "                    ->  Hash  (cost=1.06..1.06 rows=6 width=40) (actual time=0.020..0.020 rows=6 loops=1)"
 "                          Buckets: 1024  Batches: 1  Memory Usage: 9kB"
 "                          ->  Seq Scan on pizzeria pz  (cost=0.00..1.06 rows=6 width=40) (actual time=0.011..0.012 rows=6 loops=1)"
 "Planning Time: 2.011 ms"
 "Execution Time: 0.204 ms"
 */
/*
 "QUERY PLAN"
 Sort (cost=25.95..26.00 rows=19 width=96) (actual time=0.137..0.138 rows=19 loops=l)
 Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
 Sort Method: quicksort Memory. 26kB
 -> WindowAgg (cost=O.27..25.54 rows=19 width=96) (actual time=0.093..O.112 rows=19 loops—I)
 -> Nested Loop (cost=0.27..25.21 rows=19 width=64) (actual time=O.082..0.095 rows=19 loops—I)
 -> Index Scan using idx_l on pizzeria pz (cost=O.13..12.22 rows—6 width=40) (actual time=O.030..0.031 rows—6 loops—I)
 -> Index Only Scan using idx_menu_unique on menu m (cost=0.14..2.15 rows—I width=40) (actual time—O.009..0.010 rows—3 loops=6)
 Index Cond: (pizzeria_id = pz.id)
 Heap Fetches: 19
 Planning Time: 0.730 ms
 Execution Time: 0.163 ms
 */