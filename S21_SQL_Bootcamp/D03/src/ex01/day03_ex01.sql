SELECT
    id AS menu_id
FROM
    menu
EXCEPT
SELECT
    menu_id
FROM
    person_order
ORDER BY
    menu_id;

/* Найдите все идентификаторы меню, которые никем не 
 * были заказаны. Результат должен быть отсортирован 
 * по идентификатору. Пример вывода приведен ниже.
 * menu_id
 * 5
 * 10
 ...
 */
/* RESULT:
 * "menu_id"
 * "5"
 * "10"
 * "11"
 * "12"
 * "15"
 */