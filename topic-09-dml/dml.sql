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


-- SHYSHKA TYMOFII - customers and reviews
-- Customers
-- Eleven customers are inserted
-- One temporary customer is deleted later, leaving ten records

INSERT INTO rest_manag.customers (
  first_name,
  last_name,
  email,
  phone_number
) VALUES 
('Olena', 'Koval', 'olena.koval@example.com', '+380000000001'),
('Andrii', 'Melnyk', 'andrii.melnyk@example.com', '+380000000002'),
('Sofiia', 'Bondar', 'sofiia.bondar@example.com', '+380000000003'),
('Maksym', 'Tkachenko', 'maksym.tkachenko@example.com', '+380000000004'),
('Iryna', 'Shevchenko', 'iryna.shevchenko@example.com', '+380000000005'),
('Dmytro', 'Kravchenko', 'dmytro.kravchenko@example.com', '+380000000006'),
('Kateryna', 'Moroz', 'kateryna.moroz@example.com', '+380000000007'),
('Artem', 'Polishchuk', 'artem.polishchuk@example.com', '+380000000008'),
('Viktoriia', 'Savchenko', 'viktoriia.savchenko@example.com', '+380000000009'),
('Bohdan', 'Rudenko', 'bohdan.rudenko@example.com', '+380000000010'),
('Test', 'Customer', 'temporary.customer@example.com', NULL);

-- Reviews
-- Locations must be inserted before this section
-- Eleven reviews are inserted
-- One duplicate test review is deleted later, leaving ten records

INSERT INTO rest_manag.reviews (
  customer_id,
  location_id,
  rating,
  comment,
  review_date
) VALUES
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'olena.koval@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    5,
    'Excellent food and very attentive staff.',
    '2026-06-02 18:30:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'andrii.melnyk@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    4,
    'Good food and friendly service.',
    '2026-06-04 19:15:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'sofiia.bondar@example.com'
    ),
    (
        SELECT MAX(location_id)
        FROM rest_manag.locations
    ),
    5,
    'The desserts were especially delicious.',
    '2026-06-08 16:45:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'maksym.tkachenko@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    3,
    'The meal was good, but the waiting time was long.',
    '2026-06-11 20:10:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'iryna.shevchenko@example.com'
    ),
    (
        SELECT MAX(location_id)
        FROM rest_manag.locations
    ),
    4,
    'Comfortable atmosphere and a varied menu.',
    '2026-06-15 17:20:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'dmytro.kravchenko@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    2,
    'The order arrived later than expected.',
    '2026-06-19 21:05:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'kateryna.moroz@example.com'
    ),
    (
        SELECT MAX(location_id)
        FROM rest_manag.locations
    ),
    5,
    'Great restaurant for a family dinner.',
    '2026-06-23 18:50:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'artem.polishchuk@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    4,
    'The main course was fresh and well prepared.',
    '2026-06-28 19:40:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'viktoriia.savchenko@example.com'
    ),
    (
        SELECT MAX(location_id)
        FROM rest_manag.locations
    ),
    5,
    'Professional staff and excellent presentation.',
    '2026-07-03 15:30:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'bohdan.rudenko@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    3,
    NULL,
    '2026-07-07 20:25:00'
),
(
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE email = 'olena.koval@example.com'
    ),
    (
        SELECT MIN(location_id)
        FROM rest_manag.locations
    ),
    5,
    'Duplicate test review.',
    '2026-07-08 10:00:00'
);


-- UPDATE examples

-- Customer changed their phone number

UPDATE rest_manag.customers
SET phone_number = '+380000000099'
WHERE email = 'olena.koval@example.com';

-- A customer updated their review

UPDATE rest_manag.reviews
SET
    rating = 5,
    comment = 'Good food, friendly service and excellent customer support'
WHERE customer_id = (
    SELECT customer_id
    FROM rest_manag.customers
    WHERE email = 'andrii.melnyk@example.com'
)
AND comment = 'Good food and friendly service.';


-- DELETE examples

-- Remove an accidental duplicate test review

DELETE FROM rest_manag.reviews
WHERE customer_id = (
    SELECT customer_id
    FROM rest_manag.customers
    WHERE email = 'olena.koval@example.com'
)
AND comment = 'Duplicate test review.';

-- Delete a temporary customer who has no related reviews, reservations or orders

DELETE FROM rest_manag.customers
WHERE email = 'temporary.customer@example.com';

-- Customers with related reviews cannot be deleted because reviews.customer_id uses ON DELETE RESTRICT.

-- END Shyshka Tymofii
