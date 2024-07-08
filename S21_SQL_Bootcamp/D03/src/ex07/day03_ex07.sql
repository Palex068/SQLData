INSERT INTO
    menu
VALUES
    (
        19,
        2,
        'greek pizza',
        800
    );

/* Пожалуйста, зарегистрируйте новую пиццу с названием 
 * "greek pizza" (use id = 19) стоимостью 800 рублей в 
 * ресторане "Dominos" (pizzeria_id = 2). Внимание: 
 * выполнение этого действия может привести к неправильному 
 * изменению данных. На самом деле, вы можете восстановить 
 * исходную модель базы данных, используя данные по ссылке 
 * в разделе "Правила дня".
 */
select
    count(*) = 1 as check
from
    menu
where
    id = 19
    and pizzeria_id = 2
    and pizza_name = 'greek pizza'
    and price = 800