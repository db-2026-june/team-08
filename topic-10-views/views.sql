-- ================================================================
-- SQL VIEWS TEMPLATE (TOPIC 10)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) CREATE VIEW scripts for required view types:
--    - Horizontal view (select specific columns)
--    - Vertical view (filter specific rows)
--    - Mixed view (columns + row filters)
--    - Join-based view (multiple tables)
--    - Subquery-based view
--    - UNION-based view
--    - View based on another view
--    - Updatable view with WITH CHECK OPTION
--
-- 2) Comments before each view explaining:
--    - Purpose of the view
--    - How it supports your project design
--
-- 3) Optional demo SELECT statements to show view output.
--
-- RECOMMENDED ORDER:
-- 1) Simple views (horizontal / vertical / mixed)
-- 2) Join and subquery views
-- 3) UNION and layered views
-- 4) CHECK OPTION view
--
-- IMPORTANT:
-- - Script must execute in PostgreSQL without errors.
-- - Keep naming consistent and readable.
-- - Submit all views in this single SQL file.
-- ================================================================

-- Add your CREATE VIEW statements below this line

--SHOPIAK KHRYSTYNA
--Horizontal View
-- Відображає лише назву страви та її ціну.
-- Використовується для швидкого перегляду меню без
-- відображення всіх характеристик страв.
CREATE VIEW rest_manag.menu_prices AS 
SELECT dish_name, price
FROM rest_manag.menu_items;

SELECT * 
FROM rest_manag.menu_prices;

--Vertical View
-- Відображає лише десерти з меню.
-- Дозволяє працювати лише з окремою категорією страв.
CREATE VIEW rest_manag.desserts AS 
SELECT *
FROM rest_manag.menu_items
WHERE category_id = 7;

SELECT *
FROM rest_manag.desserts;

--Mixed View
-- Відображає лише назву страви та час її приготування
-- для страв, які готуються не довше 10 хвилин.
-- Допомагає швидко знайти страви швидкого приготування.
CREATE VIEW rest_manag.fast_dishes AS 
SELECT dish_name, preparation_time
FROM rest_manag.menu_items
WHERE preparation_time <= 10;

SELECT * 
FROM rest_manag.fast_dishes;

--JOIN-based View
-- Відображає кожну страву разом з її інгредієнтами,
-- кількістю та одиницею вимірювання.
-- Демонструє зв'язок між таблицями menu_items,
-- menu_ingredients та ingredients.
CREATE VIEW rest_manag.ingredient_included AS 
SELECT 
      mi.dish_name, 
      i.ingredient_name,  
      mig.quantity, 
      i.unit
FROM rest_manag.menu_items AS mi
JOIN rest_manag.menu_ingredients AS mig 
  ON mi.item_id = mig.item_id
JOIN rest_manag.ingredients AS i 
  ON mig.ingredient_id = i.ingredient_id;

SELECT * 
FROM rest_manag.ingredient_included
WHERE dish_name = 'BORSCH';

--Subquery-based View

-- Відображає страви, ціна яких вища за середню
-- вартість усіх страв у меню.
-- Використовується для аналізу дорогих позицій меню.

CREATE VIEW rest_manag.expensive_dishes AS 
SELECT dish_name, price
FROM rest_manag.menu_items
WHERE price > (
  SELECT AVG(price)
  FROM rest_manag.menu_items
);

SELECT *
FROM rest_manag.expensive_dishes;

--UNION-based View
-- Об'єднує всі категорії напоїв
-- (холодні, гарячі, алкогольні, коктейлі та
-- безалкогольні коктейлі) в одне подання.
CREATE VIEW rest_manag.drinks AS 
SELECT dish_name, price
FROM rest_manag.menu_items
WHERE category_id = 8

UNION 

SELECT dish_name, price
FROM rest_manag.menu_items
WHERE category_id = 9

UNION 

SELECT dish_name, price
FROM rest_manag.menu_items
WHERE category_id = 10

UNION 

SELECT dish_name, price
FROM rest_manag.menu_items
WHERE category_id = 11

UNION 

SELECT dish_name, price
FROM rest_manag.menu_items
WHERE category_id = 12;

SELECT * 
FROM rest_manag.drinks;

--View based on another View
-- Відображає лише дорогі напої, використовуючи
-- раніше створене подання drinks.
-- Демонструє створення подання на основі іншого подання.
CREATE VIEW rest_manag.expensive_drinks AS
SELECT *
FROM rest_manag.drinks
WHERE price > 5;

SELECT *
FROM rest_manag.expensive_drinks;

-- Updatable View with CHECK OPTION
-- Відображає лише вегетаріанські страви.
-- WITH CHECK OPTION не дозволяє вставляти або
-- змінювати записи, які не належать до категорії
-- вегетаріанських страв.
CREATE VIEW rest_manag.vegetarian_only AS
SELECT *
FROM rest_manag.menu_items
WHERE category_id = 6
WITH CHECK OPTION;

SELECT *
FROM rest_manag.vegetarian_only;

