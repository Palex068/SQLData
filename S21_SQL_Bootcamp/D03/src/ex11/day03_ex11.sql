UPDATE
    menu
SET
    price = (
        SELECT
            price
        FROM
            menu
        WHERE
            pizza_name = 'greek pizza'
    ) * 0.9
WHERE
    pizza_name = 'greek pizza';

/* Пожалуйста, измените цену на  "greek pizza" на -10% от 
 * текущей стоимости. 
 * Внимание: Это упражнение может привести к неправильному 
 * изменению данных. На самом деле, вы можете перестроить 
 * исходную модель базы данных, используя данные по ссылке 
 * в разделе "Правила дня", и воспроизвести сценарий из 
 * упражнений 07, 08, 09 и 10.
 */
select
    (800 - 800 * 0.1) = price as check
from
    menu
where
    pizza_name = 'greek pizza';