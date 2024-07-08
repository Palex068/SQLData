DELETE FROM
    person_order
WHERE
    order_date = '2022-02-25';

DELETE FROM
    menu
WHERE
    pizza_name = 'greek pizza';

/* Напишите 2 инструкции SQL (DML), которые удаляют 
 * все новые заказы из упражнения №12 на основе даты 
 * заказа. Затем удалите "greek pizza" из меню. 
 * Внимание: Это упражнение может привести к неправильному 
 * изменению данных. На самом деле, вы можете перестроить 
 * исходную модель базы данных, используя данные по ссылке 
 * в разделе "Правила дня", и воспроизвести сценарий из 
 * упражнений 07, 08, 09, 10, 11, 12, и 13.
 */
select
    count(*) = 0 as check
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

select
    count(*) = 0 as check
from
    menu
where
    pizza_name = 'greek pizza';