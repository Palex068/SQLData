SET
    ENABLE_SEQSCAN TO OFF;

SELECT
    m.pizza_name,
    pz.name
FROM
    menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id;

EXPLAIN ANALYZE
SELECT
    m.pizza_name,
    pz.name
FROM
    menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id;

/* Прежде чем приступить к дальнейшим действиям, пожалуйста, 
 * напишите инструкцию SQL, которая возвращает названия пицц и 
 * соответствующих пиццерий. Пожалуйста, взгляните на пример
 * результата ниже (сортировка не требуется).
 * pizza_name	    pizzeria_name
 * cheese pizza	    Pizza Hut
 * ...	            ...
 */
/* RESULT:
 * "pizza_name",        "name"
 * "supreme pizza",     "Pizza Hut"
 * "sausage pizza",     "Pizza Hut"
 * "pepperoni pizza",   "Pizza Hut"
 * "cheese pizza",      "Pizza Hut"
 * "sicilian pizza",    "Dominos"
 * "mushroom pizza",    "Dominos"
 * "cheese pizza",      "Dominos"
 * "supreme pizza",     "DoDo Pizza"
 * "cheese pizza",      "DoDo Pizza"
 * "sausage pizza",     "Papa Johns"
 * "pepperoni pizza",   "Papa Johns"
 * "mushroom pizza",    "Papa Johns"
 * "cheese pizza",      "Papa Johns"
 * "supreme pizza",     "Best Pizza"
 * "pepperoni pizza",   "Best Pizza"
 * "cheese pizza",      "Best Pizza"
 * "sausage pizza",     "DinoPizza"
 * "pepperoni pizza",   "DinoPizza"
 * "cheese pizza",      "DinoPizza"
 */
/*Давайте представим доказательства того, что ваши индексы
 * работают для вашего SQL. Примером доказательства является
 * вывод команды EXPLAIN ANALYZE. Пожалуйста, ознакомьтесь с
 * примером команды вывода.
 ...
 ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
 ...
 */
/* Подсказка: пожалуйста, подумайте, почему ваши индексы не
 * работают напрямую и что мы должны сделать, чтобы это включить?
 */
/* "QUERY PLAN"
 * "Nested Loop  (cost=0.29..63.61 rows=19 width=64) 
 * (actual time=0.007..0.022 rows=19 loops=1)"
 * "  ->  Index Scan using idx_menu_pizzeria_id
 * on menu m  (cost=0.14..12.42 rows=19 width=40)
 * (actual time=0.003..0.005 rows=19 loops=1)"
 * "  ->  Index Scan using pizzeria_pkey on 
 * pizzeria pz  (cost=0.15..2.69 rows=1 width=40)
 * (actual time=0.001..0.001 rows=1 loops=19)"
 * "        Index Cond: (id = m.pizzeria_id)"
 * "Planning Time: 0.069 ms"
 * "Execution Time: 0.032 ms"
 */