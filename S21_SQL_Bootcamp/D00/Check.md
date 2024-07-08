# Вопросы к проверке:

## Introduction (Вступление)

|||
-|-
School 21 methodology only makes sense if peer-to-peer reviews are taken seriously. Please read all the guidelines carefully before starting the review. | Методика "Школы 21" имеет смысл только в том случае, если к рецензированию относятся серьезно. Пожалуйста, внимательно прочитайте все рекомендации, прежде чем приступать к рецензированию.
Please remain courteous, polite, respectful, and constructive in all communications during this review. | Пожалуйста, оставайтесь вежливыми, уважительными и конструктивными при общении во время этого рецензирования.
Point out possible flaws in the person's work and take the time to discuss and debate them. | Указывайте на возможные недостатки в работе сотрудника и уделяйте время их обсуждению.
Keep in mind that sometimes there may be differences in interpretation of tasks and scope of functionality. Please remain open to each other's vision. | Имейте в виду, что иногда могут быть различия в интерпретации задач и объеме функциональных возможностей. Пожалуйста, оставайтесь открытыми для понимания взглядов друг друга.

## Main part (Основная часть)

### Exercise 00 (Упражнение 00)

|||
-|-
Checks for the file `day00_ex00.sql` | Проверьте наличие файла `day00_ex00.sql`
The SQL script looks like below. | SQL-скрипт выглядит так, как показано ниже.

```sql
select name, age from person where address = 'Kazan'
```

|||
-|-
The result is below (raw ordering should be the same like on a  screen below) | Результат приведен ниже (исходный порядок должен быть таким же, как на экране ниже)

```
"Kate"      "33"
"Denis"     "13"
"Elvira"    "45"
```

### Exercise 01

|||
-|-
Checks for the file `day00_ex01.sql` | Проверьте наличие файла `day00_ex01.sql`
The SQL script looks like below. | SQL-скрипт выглядит следующим образом.

```sql
select name,age 
from person 
where address = 'Kazan' 
and gender = 'female' 
order by name
```

|||
-|-
The result is below (raw ordering should be the same like below) | Результат приведен ниже (исходный порядок должен быть таким же, как показано ниже)

```
"Elvira"	"45"
"Kate"	    "33"
```

## Exercise 02

|||
-|-
Checks for the file `day00_ex02.sql` | Проверьте наличие файла `day00_ex02.sql`
The SQL script looks like below. | SQL-скрипт выглядит следующим образом.

```sql
select name, rating 
from pizzeria 
where rating >= 3.5 and rating <= 5 
order by rating
```

|||
-|-
The result is below (raw ordering should be the same like below) |  Результат приведен ниже (исходный порядок должен быть таким же, как показано ниже).

```
"DinoPizza"	    "4.2"
"Dominos"	    "4.3"
"Pizza Hut"	    "4.6"
"Papa Johns"	"4.9"
```

|||
-|-
The SQL script looks like below (to use BETWEEN keyword). | SQL-скрипт выглядит следующим образом (для использования ключевого слова BETWEEN)

```sql
select name, rating 
from pizzeria 
where rating between 3.5 and 5 
order by rating
```

|||
-|-
The result is below (raw ordering should be the same like on a screen below) | Результат приведен ниже (исходный порядок должен быть таким же, как на экране ниже).

```
"DinoPizza"	    "4.2"
"Dominos"	    "4.3"
"Pizza Hut"	    "4.6"
"Papa Johns"	"4.9"
```

