CREATE
OR REPLACE VIEW v_persons_female AS
SELECT
    *
FROM
    person
WHERE
    gender = 'female';

CREATE
OR REPLACE VIEW v_persons_male AS
SELECT
    *
FROM
    person
WHERE
    gender = 'male';

/* Пожалуйста, создайте 2 представления базы данных 
 * (с атрибутами, аналогичными исходной таблице) на 
 * основе простой фильтрации по полу пользователей. 
 * Задайте соответствующие имена для представлений 
 * базы данных: v_persons_female и v_persons_male.
 */
SELECT
    *
FROM
    v_persons_female
ORDER BY
    1;

/* RESULT:
 * "id",    "name",     "age",  "gender",   "address"
 * "1",     "Anna",     16,     "female",   "Moscow"
 * "3",     "Kate",     33,     "female",   "Kazan"
 * "5",     "Elvira",   45,     "female",   "Kazan"
 * "6",     "Irina",    21,     "female",   "Saint-Petersburg"
 * "8",     "Nataly",   30,     "female",   "Novosibirsk"
 */
SELECT
    *
FROM
    v_persons_male
ORDER BY
    1;

/* RESULT:
 * "id",    "name",     "age",  "gender",   "address"
 * "2",     "Andrey",   21,     "male",     "Moscow"
 * "4",     "Denis",    13,     "male",     "Kazan"
 * "7",     "Peter",    24,     "male",     "Saint-Petersburg"
 * "9",     "Dmitriy",  18,     "male",     "Samara"
 */