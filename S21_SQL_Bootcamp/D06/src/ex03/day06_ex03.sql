CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET
  ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
  *
FROM
  person_discounts
WHERE
  person_id = 2
  AND pizzeria_id = 4;

-- INSERT INTO person_discounts
-- VALUES (1, 1, 1, 22);
/* На самом деле, нам нужно улучшить согласованность данных, 
 * с одной стороны, и настроить производительность, с другой. 
 * Пожалуйста, создайте уникальный индекс с несколькими столбцами
 * (с именем idx_person_discounts_unique), который предотвратит
 * дублирование парных значений идентификаторов person и pizzeria.
 * После создания нового индекса, пожалуйста, предоставьте 
 * любую простую инструкцию SQL, подтверждающую использование 
 * индекса (с помощью EXPLAIN ANALYZE). Пример “доказательства”
 * приведен ниже
 * ...
 * Index Scan using idx_person_discounts_unique on person_discounts
 * ...
 */
/*
 * "QUERY PLAN"
 * "Index Scan using idx_person_discounts_unique on person_discounts
 * (cost=0.14..8.15 rows=1 width=56)
 * (actual time=0.040..0.040 rows=0 loops=1)"
 * "  Index Cond: ((person_id = 2) AND (pizzeria_id = 4))"
 * "Planning Time: 1.042 ms"
 * "Execution Time: 0.063 ms"
 */