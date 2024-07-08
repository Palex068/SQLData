INSERT INTO
    person_order
SELECT
    (
        GENERATE_SERIES(
            (
                (
                    SELECT
                        MAX(id)
                    FROM
                        person_order
                ) + 1
            ),
            (
                (
                    SELECT
                        MAX(id)
                    FROM
                        person_order
                ) + (
                    SELECT
                        COUNT(*)
                    FROM
                        person
                )
            )
        )
    ),
    (
        GENERATE_SERIES(
            (
                SELECT
                    MIN(id)
                FROM
                    person
            ),
            (
                SELECT
                    MAX(id)
                FROM
                    person
            )
        )
    ),
    (
        SELECT
            id
        FROM
            menu
        WHERE
            pizza_name = 'greek pizza'
    ),
    TIMESTAMP '2022-02-25';

/* Пожалуйста, зарегистрируйте все новые заказы 
 * на "greek pizza" на 25 февраля 2022 года. 
 * Внимание: Это упражнение, вероятно, приведет 
 * к неправильному изменению данных. На самом деле, 
 * вы можете восстановить исходную модель базы 
 * данных с помощью данных по ссылке в разделе 
 * "Правила дня" и воспроизвести сценарий из 
 * упражнений 07, 08, 09, 10 и 11. 
 * Не используйте прямые цифры для идентификаторов 
 * первичного ключа и меню.
 */
select
    count(*) = 9 as check
from
    person_order
where
    order_date = '2022-02-25'
    and menu_id = (
        select
            id
        from
            menu
        where
            pizza_name = 'greek pizza'
    );