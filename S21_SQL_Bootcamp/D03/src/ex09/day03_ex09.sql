-- INSERT INTO
--     person_visits
-- VALUES
--     (
--         (
--             SELECT
--                 MAX(id)
--             FROM
--                 person_visits
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
--                 pi.id
--             FROM
--                 pizzeria pi
--             WHERE
--                 pi.name = 'Dominos'
--         ),
--         (TIMESTAMP '2022-02-24') :: date
--     ),
--     (
--         (
--             SELECT
--                 MAX(id)
--             FROM
--                 person_visits
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
--                 pi.id
--             FROM
--                 pizzeria pi
--             WHERE
--                 pi.name = 'Dominos'
--         ),
--         TIMESTAMP '2022-02-24'
--     );
/* Пожалуйста, запишите новые посещения ресторана 
 * Domino's Денисом и Ириной 24 февраля 2022 года. 
 * Внимание: Это упражнение может привести к 
 * неправильному изменению данных. На самом деле, 
 * вы можете восстановить исходную модель базы данных, 
 * используя данные по ссылке в разделе "Правила дня", 
 * и воспроизвести сценарий из ex07 и ex08.
 * Не используйте прямые цифры для идентификаторов 
 * первичного ключа и пиццерии.
 */
select
    count(*) = 2 as check
from
    person_visits
where
    visit_date = '2022-02-24'
    and person_id in (6, 4)
    and pizzeria_id = 2;