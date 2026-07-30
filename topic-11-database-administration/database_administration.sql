-- ================================================================
-- DATABASE ADMINISTRATION TEMPLATE (TOPIC 11)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) CREATE ROLE statements for at least 2 distinct roles.
--    Example roles: read-only analyst, read-write editor.
--
-- 2) GRANT statements assigning appropriate permissions to each role:
--    - Read-only role: GRANT SELECT ON ALL TABLES IN SCHEMA ...
--    - Read-write role: GRANT SELECT, INSERT, UPDATE, DELETE ...
--
-- 3) CREATE USER statements for at least 2 users.
--    Each user must be assigned to one of the defined roles.
--
-- 4) Comments before each section explaining the rationale:
--    - Why this role exists
--    - What access it should and should not have
--
-- RECOMMENDED ORDER:
-- 1) Roles + their GRANTs
-- 2) Users + GRANT ROLE TO USER
-- 3) Optional: REVOKE statements for fine-grained restrictions
-- 4) Optional cleanup block (commented out by default):
--    -- DROP USER ...; DROP ROLE ...;
--
-- IMPORTANT:
-- - Use explicit GRANT / REVOKE statements — do not rely on defaults.
-- - Roles must have meaningfully different permission levels.
-- - Script must execute in PostgreSQL without errors.
-- ================================================================

-- Add your script below this line
--SHOPIAK KHRYSTYNA
BEGIN;

-- Створення ролей
CREATE ROLE chef;
CREATE ROLE barmen;

-- Надання прав ролям
-- Роль шефа
-- Має повний доступ до таблиць меню, інгредієнтів,
-- а також до таблиць, що містять інформацію про працівників.
-- Такий рівень доступу необхідний для створення нових страв,
-- редагування рецептів та керування запасами.
-- Повний доступ надається лише відповідальній особі,
-- що підтримує цілісність даних.

GRANT SELECT
ON rest_manag.ingredient_included,
rest_manag.fast_dishes,
rest_manag.menu_prices,
rest_manag.expensive_dishes,
rest_manag.desserts
TO chef;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON rest_manag.location_ingredients,
rest_manag.ingredients,
rest_manag.menu_categories,
rest_manag.menu_items,
rest_manag.menu_ingredients,
rest_manag.locations,
rest_manag.staff,
rest_manag.staff_shifts,
rest_manag.shifts,
rest_manag.order_item,
rest_manag.orders,
rest_manag.inventory
TO chef;

-- Роль бармена.
-- Має доступ лише до інформації про напої
-- та може оновлювати залишки інгредієнтів,
-- які використовуються для приготування напоїв,
-- також має доступ до графіків роботи.
-- Видалення записів заборонено для забезпечення
-- цілісності складських даних.

GRANT SELECT
ON rest_manag.drinks,
rest_manag.location_ingredients,
rest_manag.menu_categories,
rest_manag.ingredients,
rest_manag.order_item, 
rest_manag.orders,
rest_manag.shifts,
rest_manag.staff_shifts,
rest_manag.staff
TO barmen;

GRANT UPDATE, INSERT, DELETE 
ON rest_manag.location_ingredients
TO barmen;

-- Створення користувачів
CREATE USER simon
WITH PASSWORD 'SimonTheBest';

GRANT chef TO simon;


CREATE USER patrik
WITH PASSWORD 'PatrikTheBest';

GRANT barmen TO patrik;

-- Забороняємо бармену видаляти записи із таблиці залишків.
-- Це запобігає випадковій втраті інформації про складські запаси.

REVOKE DELETE 
ON rest_manag.location_ingredients
FROM barmen;


COMMIT;


--Приклад видалення ролі та користувача
--DROP USER patrik;
--DROP ROLE barmen;
