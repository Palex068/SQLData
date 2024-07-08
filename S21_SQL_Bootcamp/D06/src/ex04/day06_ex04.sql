ALTER TABLE
    person_discounts
ADD
    CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),
ADD
    CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL),
ADD
    CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL),
ALTER COLUMN
    discount
SET
    DEFAULT 0,
ADD
    CONSTRAINT ch_range_discount CHECK (
        discount BETWEEN 0
        AND 100
    );

/* Пожалуйста, добавьте следующие constraint rules для
 * существующих столбцов таблицы person_discounts.
 * + столбец person_id не должен быть пустым (используйте 
 *   имя ограничения ch_nn_person_id).
 * + столбец pizzeria_id не должен быть ПУСТЫМ (используйте
 *   имя ограничения ch_nn_pizzeria_id)
 * + столбец скидок не должен быть пустым (используйте
 *   имя ограничения ch_nn_discount)
 * + столбец скидок должен быть равен 0 процентам, по умолчанию
 * + столбец скидок должен находиться в диапазоне значений
 *   от 0 до 100 (используйте имя ограничения ch_range_discount)
 */