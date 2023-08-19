use lesson_2;

drop table if exists films; 
CREATE TABLE films (
	film_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    year YEAR NOT NULL,
    length INT NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO films (name, year, length, description)
VALUES 
	('Игры разума',  2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
	('Форрест Гамп',  1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
	('Иван Васильевич меняет профессию',  1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
	('Назад в будущее',  1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
	('Криминальное чтиво',  1994, 154, '');
    
 RENAME TABLE films to movies;   
 
alter table movies
add column country varchar(50);

alter table movies
drop column country;

CREATE TABLE studentMarks (stud_id INT NOT NULL AUTO_INCREMENT
 PRIMARY KEY, total_marks INT, grade VARCHAR(5));
INSERT INTO studentMarks(total_marks, grade)
 VALUES
(450, 'A'), 
(480, 'A+'), 
(490, 'A++'), 
(440, 'B+'),
(400, 'C+'),
(380,'C'),
(250, 'D'),
(200,'E'),
(100,'F'),
(150,'F'),
(220, 'E');



SELECT *,
  CASE 
	WHEN grade = 'A++' THEN 'DISTINCTION'
	WHEN grade = 'A+' THEN 'FIRST CLASS'
    WHEN grade = 'A' or grade = 'B+' THEN 'SECOND CLASS'
    WHEN grade = 'C+' THEN 'THIRD CLASS'
  ELSE 'FAIL'
  end as class
FROM studentmarks;

select *, CASE
		WHEN total_marks > 450 THEN 'ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ'
        WHEN total_marks between 400 AND  450 THEN 'ПЕРВЫЙ КЛАСС'
        WHEN total_marks between 350 and 399 THEN 'ВТОРОЙ КЛАСС'
        WHEN total_marks between 300 AND 349  THEN 'ТРЕТИЙ КЛАСС'
        ELSE 'НЕУДАЧА'
        END as class
        from studentmarks;
        
        
SELECT IF (100<200, 'yes', 'no'); 


SELECT *, 
	IF (total_marks > 450, 'Отлично', 'Хорошо') as result
FROM studentmarks;       

