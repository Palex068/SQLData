/*
 * Сделайте запрос, который возвращает одно 
 * вычисляемое поле с именем "person_information"
 * в одной строке, как описано в следующем примере:
 * 
 * Anna (age:16,gender:'female',address:'Moscow')
 * 
 * Добавьте условия сортировки по вычисляемому 
 * столбцу по возрастанию. 
 * Обратите внимание на кавычки в вашей формуле!
 */
SELECT
    CONCAT(
        name,
        ' (age:',
        age :: VARCHAR,
        ',gender:''',
        gender,
        ''',address:''',
        address,
        ''')'
    ) AS person_information
FROM
    person
ORDER BY
    person_information;