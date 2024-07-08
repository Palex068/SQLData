WITH main AS (
    SELECT
        po.person_id,
        m.pizzeria_id,
        COUNT(m.pizzeria_id) AS count,
        CASE
            WHEN (COUNT(m.pizzeria_id) = 1) THEN 10.5
            WHEN (COUNT(m.pizzeria_id) = 2) THEN 22
            ELSE 30
        END AS discount
    FROM
        person_order po
        JOIN menu m ON po.menu_id = m.id
    GROUP BY
        person_id,
        pizzeria_id
    ORDER BY
        1
)
INSERT INTO
    person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER () AS id,
    main.person_id,
    main.pizzeria_id,
    main.discount
FROM
    main;

/* На самом деле, мы создали структуру для хранения наших скидок
 * и готовы пойти дальше и заполнить нашу таблицу person_discounts
 * новыми записями.
 *
 * Итак, есть таблица person_order, в которой хранится история
 * заказов пользователя. Пожалуйста, напишите инструкцию DML
 * (INSERT INTO ... SELECT ...), которая вставляет новые записи
 * в таблицу person_discounts на основе следующих правил.
 * + возьмите агрегированное состояние по столбцам person_id и
 *   pizzeria_id
 * + рассчитайте значение персональной скидки по следующему псевдокоду:
 *
 * if “amount of orders” = 1
 * then “discount” = 10.5
 * else
 * 
 * if “amount of orders” = 2
 * then “discount” = 22
 * else “discount” = 30
 *
 * + чтобы сгенерировать первичный ключ для таблицы person_discounts,
 *   пожалуйста, используйте приведенную ниже конструкцию SQL (эта
 *   конструкция взята из области WINDOW FUNCTION SQL).
 
 ... ROW_NUMBER( ) OVER ( ) AS id ...
 */
select
    count(*) > 0 as check
from
    person_discounts;