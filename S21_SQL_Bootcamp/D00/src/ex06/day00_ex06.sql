/*
 * Используйте конструкцию SQL из упражнения 05 и добавьте 
 * новый вычисляемый столбец (используйте имя столбца 
 * ‘check_name’) с оператором проверки (псевдокод для 
 * этой проверки приведен ниже).
 *  if (person_name == 'Denis') 
 *     then return true
 *     else return false
 */
SELECT
    (
        SELECT
            name
        FROM
            person
        WHERE
            person.id = person_order.person_id
    ) AS name,
    (
        SELECT
            name
        FROM
            person
        WHERE
            person.id = person_order.person_id
    ) = 'Denis' AS check_name
FROM
    person_order
WHERE
    (
        menu_id = 13
        OR menu_id = 14
        OR menu_id = 18
    )
    AND order_date = '2022-01-07';