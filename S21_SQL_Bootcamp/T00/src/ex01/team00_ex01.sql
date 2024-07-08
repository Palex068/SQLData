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
    OR sum = (
        SELECT
            max(sum)
        FROM
            way
        WHERE
            length(tour) = 7
            AND point2 = 'a'
    )
ORDER BY
    1,
    2;

/* Пожалуйста, добавьте в SQL-запрос из предыдущего упражнения 
 * способ просмотра дополнительных строк с наиболее высокой
 * стоимостью. Взгляните на примеры данных, приведенные ниже.
 * Пожалуйста, отсортируйте данные по total_cost, а затем по trip.
 * total_cost	tour
 * 80       	{a,b,d,c,a}
 * ...	        ...
 * 95       	{a,d,c,b,a}
 */
/* RESULT:
 * "total_cost","tour"
 * 80,"{a,b,d,c,a}"
 * 80,"{a,c,d,b,a}"
 * 95,"{a,b,c,d,a}"
 * 95,"{a,b,d,c,a}"
 * 95,"{a,c,b,d,a}"
 * 95,"{a,c,d,b,a}"
 * 95,"{a,d,b,c,a}"
 * 95,"{a,d,c,b,a}"
 */