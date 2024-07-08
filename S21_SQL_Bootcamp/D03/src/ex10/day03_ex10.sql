-- INSERT INTO
--     person_order
-- VALUES
--     (
--         (
--             SELECT
--                 MAX(id)
--             FROM
--                 person_order
--         ) + 1,
--         (
--             SELECT
--                 p.id
--             FROM
--                 person p
--             WHERE
--                 p.name = 'Denis'
--         ),
--         (
--             SELECT
--                 m.id
--             FROM
--                 menu m
--             WHERE
--                 m.pizza_name = 'sicilian pizza'
--         ),
--         TIMESTAMP '2022-02-24'
--     ),
--     (
--         (
--             SELECT
--                 MAX(id)
--             FROM
--                 person_order
--         ) + 2,
--         (
--             SELECT
--                 p.id
--             FROM
--                 person p
--             WHERE
--                 p.name = 'Irina'
--         ),
--         (
--             SELECT
--                 m.id
--             FROM
--                 menu m
--             WHERE
--                 m.pizza_name = 'sicilian pizza'
--         ),
--         TIMESTAMP '2022-02-24'
--     );
/* Пожалуйста, зарегистрируйте новые заказы от Дениса 
 * и Ирины на 24 февраля 2022 года для нового меню с 
 * "sicilian pizza". 
 * Внимание: Это упражнение, вероятно, приведет к 
 * неправильному изменению данных. На самом деле, 
 * вы можете восстановить исходную модель базы данных, 
 * используя данные по ссылке в разделе "Правила дня", 
 * и воспроизвести сценарий из упражнений 07, 08 и 09.
 * Не используйте прямые цифры для идентификаторов 
 * первичного ключа и пиццерии.
 */
select
    count(*) = 2 as check
from
    person_order
where
    order_date = '2022-02-24'
    and person_id in (6, 4)
    and menu_id =(
        select
            id
        from
            menu
        where
            pizza_name = 'sicilian pizza'
    );