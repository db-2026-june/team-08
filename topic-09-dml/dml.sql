-- ================================================================
-- SQL DML TEMPLATE (TOPIC 09)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) INSERT scripts for all required tables in your database.
-- 2) At least 10 records per table with meaningful, realistic values.
-- 3) UPDATE / DELETE scripts where they are relevant to business logic.
-- 4) If UPDATE / DELETE are not relevant for a table, add a short note
--    in documentation explaining why.
-- 5) Comments by section so the script is easy to read and run.
--
-- SCRIPT GOALS:
-- - Populate the database with usable test data.
-- - Validate constraints through realistic DML scenarios.
-- - Support the core functionality of your application.
--
-- RECOMMENDED ORDER:
-- 1) Reference data (lookups/dictionaries)
-- 2) Core entities
-- 3) Transactional data
-- 4) Optional UPDATE / DELETE checks
--
-- IMPORTANT:
-- - Use anonymized or privacy-safe sample data where possible.
-- - The script must execute in PostgreSQL.
-- - Submit this as one SQL file.
-- ================================================================

-- Add your DML below this line

--SHOPIAK KHRYSTYNA
-- Menu categories 
INSERT INTO rest_manag.menu_categories(category_name) VALUES
('APPETIZERS'), 
('SALADS'),
('SOUPS'),
('FISH'),
('MEAT'),
('VEGETARIAN'),
('DESSERTS'),
('COLD DRINKS'),
('HOT DRINKS'),
('ALCOHOLIC DRINKS'),
('COCKTAILS'),
('NON-ALCOHOLIC COCKTAILS');

--Ingredients
INSERT INTO rest_manag.ingredients(ingredient_name, unit) VALUES 
('chicken liver', 'g'),
('butter', 'g'),
('onion', 'g'),
('salami', 'g'),
('prosciutto', 'g'),
('ham', 'g'),
('cheddar', 'g'),
('cracker', 'g'),
('grape', 'g'),
('romaine lettuce', 'g'),
('croutons', 'g'),
('parmesan', 'g'),
('iceberg', 'g'),
('duck', 'g'),
('strawberry', 'g'),
('chicken', 'g'),
('carrot', 'g'),
('beetroot', 'g'),
('milk', 'ml'),
('potato', 'g'),
('salmon', 'g'),
('rosemary', 'g'),
('wild mushrooms', 'g'),
('zucchini', 'g'),
('bell pepper', 'g'),
('cream cheese', 'g'),
('sugar', 'g'),
('coca cola', 'ml'),
('coffee', 'g'),
('prosecco', 'ml'),
('rum', 'ml'),
('mint', 'g'),
('lime', 'g'),
('lemon', 'g');

--Menu items
INSERT INTO rest_manag.menu_items (dish_name, price, preparation_time, category_id) VALUES
('THREE KINDS OF PATE', 10, 10, 1),
('MEAT PLATE', 15, 7, 1),
('PLATE OF LOCAL CHEESE', 9, 7, 1),
('CAESAR SALAD', 10, 15, 2),
('SALAD WITH DRIED DUCK AND STRAWBERRIES', 12, 15, 2),
('BORSCH', 9, 10, 3),
('CHICKEN SOUP', 6, 10, 3),
('POTATO PANCAKE WITH SALMON', 13, 20, 4),
('ROAST DUCK', 5, 20, 5),
('POTATO PANCAKE WITH DUCK', 12, 17, 5),
('POTATO PANCAKE WITH CARPATHIAN WILD MUSHROOMS', 15, 17, 6),
('GRILLED VEGETABLES', 8, 15, 6),
('LVIV CHEESECAKE', 5, 7, 7),
('COCA COLA', 3, 1, 8),
('CAPPUCCINO', 5, 5, 9),
('PROSECCO', 5, 3, 10),
('MOJITO', 10, 7, 11),
('LEMONADE', 7, 5, 12);

--Menu Ingredients
INSERT INTO rest_manag.menu_ingredients (ingredient_id, item_id, quantity) VALUES
(1, 1, 70),
(2, 1, 10),
(3, 1, 10),
(4, 2, 50),
(5, 2, 50),
(6, 2, 50),
(7, 3, 50),
(8, 3, 70),
(9, 3, 30),
(10, 4, 35),
(11, 4, 50),
(12, 4, 25),
(13, 5, 50),
(14, 5, 60),
(15, 5, 45),
(16, 6, 50),
(17, 6, 15),
(18, 6, 15),
(16, 7, 50),
(17, 7, 15),
(3, 7, 15),
(19, 8, 20),
(20, 8, 50),
(21, 8, 50),
(14, 9, 100),
(3, 9, 25),
(22, 9, 7),
(19, 10, 20),
(20, 10, 50),
(14, 10, 100),
(20, 11, 50),
(23, 11, 100),
(19, 11, 20),
(24, 12, 100),
(25, 12, 100),
(17, 12, 100),
(26, 13, 125),
(27, 13, 25),
(19, 13, 10),
(28, 14, 350),
(29, 15, 20),
(19, 15, 100),
(30, 16, 100),
(31, 17, 50),
(32, 17, 20),
(33, 17, 50),
(34, 18, 50),
(27, 18, 25);

-- Location ingredients
-- This section will be completed after the Location table
-- and location_id values are added by another team member.

--UPDATE examples
UPDATE rest_manag.menu_items 
SET price = 11
WHERE item_id = 1;

UPDATE rest_manag.menu_items
SET preparation_time = preparation_time + 3
WHERE preparation_time < 10;

UPDATE rest_manag.menu_ingredients
SET quantity = 70
WHERE ingredient_id = 20
AND item_id = 8;

UPDATE rest_manag.menu_items
SET price = price + 2
WHERE item_id = 4;


-- DELETE examples are omitted because menu_items and ingredients
-- are referenced by menu_ingredients through foreign key constraints.

--END SHOPIAK KHRYSTYNA
