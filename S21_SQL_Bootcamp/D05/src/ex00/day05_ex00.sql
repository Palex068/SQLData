CREATE INDEX idx_person_visits_person_id ON person_visits (person_id);

CREATE INDEX idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);

CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);

CREATE INDEX idx_person_order_person_id ON person_order (person_id);

CREATE INDEX idx_person_order_menu_id ON person_order (menu_id);

/* Пожалуйста, создайте простой индекс BTree для каждого внешнего
 * ключа в нашей базе данных. Шаблон имени должен удовлетворять
 * следующему правилу “idx_{имя_таблицы}_{имя_столбца}”.
 * Например, имя BTree index для столбца pizzeria_id в таблице
 * меню равно idx_menu_pizzeria_id.
 */