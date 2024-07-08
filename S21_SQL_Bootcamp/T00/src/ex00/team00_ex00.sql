/* Создание таблицы*/
-- CREATE TABLE IF NOT EXISTS nodes (
--     point1 char NOT NULL,
--     point2 char NOT NULL,
--     cost int NOT NULL
-- );
/* Заполнение таблицы*/
-- INSERT INTO
--     nodes (point1, point2, cost)
-- VALUES
--     ('a', 'b', 10),
--     ('a', 'c', 15),
--     ('a', 'd', 20),
--     ('b', 'a', 10),
--     ('b', 'd', 25),
--     ('b', 'c', 35),
--     ('c', 'b', 35),
--     ('c', 'd', 30),
--     ('c', 'a', 15),
--     ('d', 'a', 20),
--     ('d', 'b', 25),
--     ('d', 'c', 30);
/* Есть 4 города (a, b, c и d) и дуги между ними с указанием 
 * затрат (или налогов). На самом деле стоимость равна (a,b) = (b,a).
 * Пожалуйста, создайте таблицу с именованными узлами, используя
 * структуру {points1, point2, cost} и заполните данные на основе
 * рисунка (помните, что между двумя узлами есть прямой и обратный
 * пути). Пожалуйста, напишите инструкцию SQL, которая возвращает
 * все туры (или маршруты) с минимальной стоимостью проезда, если
 * мы начинаем с города "а". Помните, что вам нужно найти самый
 * дешевый способ посетить все города и вернуться в исходную точку.
 * Например, тур выглядит следующим образом: a -> b -> c -> d -> a.
 * Ниже приведен пример выходных данных. Пожалуйста, отсортируйте
 * данные по общей стоимости, а затем по туру.
 */
/* Проверка заполнения */
SELECT
    *
FROM
    nodes;

/* Рекурсия */
CREATE
OR REPLACE VIEW way AS (
    WITH RECURSIVE tour AS (
        SELECT
            point1 :: bpchar AS tour,
            point1,
            point2,
            cost,
            cost AS sum
        FROM
            nodes
        WHERE
            point1 = 'a'
        UNION
        ALL
        SELECT
            parent.tour || ',' || parent.point2 AS tour,
            child.point1,
            child.point2,
            parent.cost,
            parent.sum + child.cost AS sum
        FROM
            nodes AS child
            JOIN tour AS parent ON child.point1 = parent.point2
        WHERE
            tour NOT LIKE '%' || parent.point2 || '%'
    )
    SELECT
        *
    FROM
        tour
);

/* Выведем созданное представление*/
-- SELECT
--     *
-- FROM
--     way;
/* Найдем наименее дорогие пути*/
SELECT
    sum AS total_cost,
    '{' || tour || ',a' || '}' AS tour
FROM
    way
WHERE
    length(tour) = 7
    AND point2 = 'a'
    AND sum = (
        SELECT
            min(sum)
        FROM
            way
        WHERE
            length(tour) = 7
            AND point2 = 'a'
    )
ORDER BY
    1,
    2;

/* RESULT:
 * "total_cost","tour"
 * 80,"{a,b,d,c,a}"
 * 80,"{a,c,d,b,a}"
 */