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


-- SHYSHKA TYMOFII

-- Horizontal View
-- Displays only customers who have provided a phone number
-- It helps staff quickly find customers who can be contacted by phone

CREATE VIEW rest_manag.customers_with_phone AS
SELECT *
FROM rest_manag.customers
WHERE phone_number IS NOT NULL;

SELECT *
FROM rest_manag.customers_with_phone;

-- Vertical View
-- Displays the main contact information about customers: customer ID, first name, last name, email and phone number
-- It supports quick access to customer contact details without showing the account creation date

CREATE VIEW rest_manag.customer_contacts AS
SELECT 
      customer_id,
      first_name,
      last_name,
      email,
      phone_number
FROM rest_manag.customers;

SELECT * 
FROM rest_manag.customer_contacts;

-- Mixed View
-- Displays selected information about positive customer reviews
-- It shows only reviews with a rating 4 or 5
-- It helps restaurant staff quickly analyze positive customer feedback

CREATE VIEW rest_manag.positive_reviews AS
SELECT 
      review_id,
      customer_id,
      location_id,
      rating,
      comment
FROM rest_manag.reviews
WHERE rating >= 4;

SELECT *
FROM rest_manag.positive_reviews;

-- Join based View
-- Displays customer reviews together with the customer's full name and the name of the restaurant location
-- It helps restaurant staff understand who submitted each review and which location the review belongs to

CREATE VIEW rest_manag.customer_review_details AS
SELECT
      r.review_id,
      c.first_name,
      c.last_name,
      l.location_name,
      r.rating,
      r.comment,
      r.review_date
FROM rest_manag.reviews AS r
JOIN rest_manag.customers AS c
      ON r.customer_id = c.customer_id
JOIN rest_manag.locations AS l
      ON r.location_id = l.location_id;

SELECT *
FROM rest_manag.customer_review_details;

-- Subquery based View
-- Displays reviews with a rating higher than the average rating of all customer reviews
-- It helps restaurant staff identify feedback that is better than the overall average

CREATE VIEW rest_manag.above_average_reviews AS
SELECT
      review_id,
      customer_id,
      location_id,
      rating,
      comment,
      review_date
FROM rest_manag.reviews
WHERE rating > (
      SELECT AVG(rating)
      FROM rest_manag.reviews
);

SELECT *
FROM rest_manag.above_average_reviews;

-- UNION based View
-- Combines positive and negative customer reviews into one view
-- Each review is labeled according to its feedback category
-- It helps restaurant staff quickly compare positive and negative feedback

CREATE VIEW rest_manag.review_feedback_categories AS
SELECT
      review_id,
      customer_id,
      rating,
      comment,
      'Positive' AS feedback_category
FROM rest_manag.reviews
WHERE rating >= 4

UNION

SELECT 
      review_id,
      customer_id,
      rating,
      comment,
      'Negative' AS feedback_category
FROM rest_manag.reviews
WHERE rating <= 2;

SELECT *
FROM rest_manag.review_feedback_categories;

-- View based on another view
-- Displays detailed information only about positive customer reviews
-- It uses the previously created customer_review_details view and helps staff quickly analyze reviews with ratings of 4 or 5

CREATE VIEW rest_manag.positive_review_details AS
SELECT 
      review_id,
      first_name,
      last_name,
      location_name,
      rating,
      comment,
      review_date
FROM rest_manag.customer_review_details
WHERE rating >= 4;

SELECT *
FROM rest_manag.positive_review_details;

-- Updatable view with CHECK OPTION
-- Displays only customers who have provided a phone number
-- The WITH CHECK OPTION prevents inserting or updating customers through this view if their phone number is NULL

CREATE VIEW rest_manag.customers_with_required_phone AS
SELECT *
FROM rest_manag.customers
WHERE phone_number IS NOT NULL
WITH CHECK OPTION;

SELECT *
FROM rest_manag.customers_with_required_phone;

-- END SHYSHKA TYMOFII
      
