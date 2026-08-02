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

-- Доступ до схеми
GRANT USAGE ON SCHEMA rest_manag TO chef;
GRANT USAGE ON SCHEMA rest_manag TO barmen;

-- =====================================================
-- Роль: chef
-- Призначення:
-- Шеф-кухар керує меню, рецептами, інгредієнтами,
-- запасами та інформацією про персонал.
--
-- Таблиці та подання:
-- menu_items, menu_categories, menu_ingredients,
-- ingredients, location_ingredients, inventory,
-- orders, order_item, staff, staff_shifts,
-- shifts, locations, а також подання:
-- menu_prices, fast_dishes, desserts,
-- ingredient_included, expensive_dishes.
--
-- Причина такого розподілу:
-- Шеф відповідає за створення та зміну меню,
-- контроль запасів і роботу персоналу,
-- тому потребує повного доступу до цих даних.
--
-- Безпекові міркування:
-- Повний доступ надається лише шефу,
-- що зменшує ризик несанкціонованих змін
-- у меню та складських даних.
-- =====================================================

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

-- =====================================================
-- Роль: barmen
-- Призначення:
-- Бармен працює лише з напоями та
-- контролює використання інгредієнтів
-- для їх приготування.
--
-- Таблиці та подання:
-- drinks, location_ingredients,
-- ingredients, menu_categories,
-- orders, order_item,
-- staff, staff_shifts, shifts.
--
-- Причина такого розподілу:
-- Бармену потрібен доступ лише до
-- інформації, необхідної для виконання
-- його щоденних обов'язків.
--
-- Безпекові міркування:
-- Бармен може переглядати дані та
-- оновлювати залишки інгредієнтів,
-- але не має права видаляти записи,
-- що допомагає зберегти цілісність
-- складських даних.
-- =====================================================

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


-- SHYSHKA TYMOFII

BEGIN;

-- This role is used by customer support employees
-- It allows them to manage customer contact information but it doesn't allow them to delete customer records
CREATE ROLE customer_support_role NOLOGIN;

-- This role is used by review moderators
-- It allows them to manage reviews while customer information remains read-only
CREATE ROLE review_moderator_role NOLOGIN;

-- Access to the schema
GRANT USAGE ON SCHEMA rest_manag
TO customer_support_role;

GRANT USAGE ON SCHEMA rest_manag
TO review_moderator_role;

-- =====================================================
-- Role: customer_support_role
--
-- Purpose:
-- Customer support employees manage customer contact information and can view customer reviews
-- Allowed:
-- SELECT, INSERT and UPDATE on customers
-- SELECT on reviews
--
-- Restricted:
-- Customer records cannot be deleted
-- Reviews cannot be inserted, updated or deleted
-- =====================================================
GRANT SELECT, INSERT, UPDATE
ON rest_manag.customers
TO customer_support_role;

GRANT SELECT
ON rest_manag.reviews
TO customer_support_role;

-- Required for generating customer_id values because the customers table uses a bigserial primary key
GRANT USAGE, SELECT
ON SEQUENCE rest_manag.customers_customer_id_seq
TO customer_support_role;

-- =====================================================
-- ROLE: review_moderator_role
--
-- Purpose:
-- Review moderators verify and manage customer reviews
--
-- Allowed:
-- SELECT on customers
-- SELECT, INSERT, UPDATE and DELETE on reviews
--
-- Restricted:
-- Customer information is read-only
-- =====================================================

GRANT SELECT 
ON rest_manag.customers
TO review_moderator_role;

GRANT SELECT, INSERT, UPDATE, DELETE
ON rest_manag.reviews
TO review_moderator_role;

-- Required for generating review_id values because the reviews table uses a bigserial primary key
GRANT USAGE, SELECT
ON SEQUENCE rest_manag.reviews_review_id_seq
TO review_moderator_role;

--RESTRICTIONS

-- Customer support must not delete customer records
REVOKE DELETE
ON rest_manag.customers
FROM customer_support_role;

-- Customer support can view reviews but cannot modify them
REVOKE INSERT, UPDATE, DELETE
ON rest_manag.reviews
FROM customer_support_role;

-- Review moderators can view customer information but cannot modify customer records
REVOKE INSERT, UPDATE, DELETE
ON rest_manag.customers
FROM review_moderator_role;


--USER CREATION

-- This user can work with customers
CREATE USER support_user
WITH PASSWORD 'SupportUser2026!';

GRANT customer_support_role
TO support_user;

-- This user moderates customer reviews
CREATE USER moderator_user
WITH PASSWORD 'ModeratorUser2026!';

GRANT review_moderator_role
TO moderator_user;

COMMIT;

-- Example of deleting users and roles
-- DROP USER support_user;
-- DROP USER moderator_user;
-- DROP ROLE customer_support_role;
-- DROP ROLE review_moderator_role;

-- END SHYSHKA TYMOFII
