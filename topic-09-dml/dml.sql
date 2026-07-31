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

--BRYTAN VITALII
-- locations
INSERT INTO rest_manag.locations (
    location_id, location_name, street, city, state_province, postal_code, country, phone_number
) VALUES
(1, 'Київ Центр', 'вул. Хрещатик, 15', 'Київ', 'Київська область', '01001', 'Україна', '+380442221111'),
(2, 'Львів Плаза', 'просп. Свободи, 8', 'Львів', 'Львівська область', '79000', 'Україна', '+380322223333'),
(3, 'Одеса Порт', 'вул. Дерибасівська, 22', 'Одеса', 'Одеська область', '65000', 'Україна', '+380482224444'),
(4, 'Харків Центральний', 'вул. Сумська, 45', 'Харків', 'Харківська область', '61000', 'Україна', '+380572225555'),
(5, 'Дніпро Сіті', 'просп. Дмитра Яворницького, 12', 'Дніпро', 'Дніпропетровська область', '49000', 'Україна', '+380562226666'),
(6, 'Запоріжжя Молл', 'просп. Соборний, 100', 'Запоріжжя', 'Запорізька область', '69000', 'Україна', '+380612227777'),
(7, 'Вінниця Центр', 'вул. Соборна, 28', 'Вінниця', 'Вінницька область', '21000', 'Україна', '+380432228888'),
(8, 'Полтава Маркет', 'вул. Європейська, 17', 'Полтава', 'Полтавська область', '36000', 'Україна', '+380532229999'),
(9, 'Чернігів Плаза', 'просп. Миру, 31', 'Чернігів', 'Чернігівська область', '14000', 'Україна', '+380462221010'),
(10, 'Івано-Франківськ Центр', 'вул. Незалежності, 56', 'Івано-Франківськ', 'Івано-Франківська область', '76000', 'Україна', '+380342221212');

-- staff
INSERT INTO rest_manag.staff (
    staff_id, location_id, staff_role, first_name, last_name, phone_number
) VALUES
(1, 1, 'Менеджер', 'Олександр', 'Шевченко', '+380671111111'),
(2, 1, 'Офіціант', 'Марія', 'Коваленко', '+380672222222'),
(3, 1, 'Шеф-кухар', 'Андрій', 'Бондар', '+380673333333'),
(4, 1, 'Адміністратор', 'Софія', 'Мельник', '+380674444444'),
(5, 2, 'Менеджер', 'Віктор', 'Шевченко', '+380675555555'),
(6, 2, 'Офіціант', 'Галина', 'Попель', '+380676666666'),
(7, 2, 'Шеф-кухар', 'Андрій', 'Семеренко', '+380677777777'),
(8, 2, 'Адміністратор', 'Ольга', 'Войтків', '+380678888888'),
(9, 3, 'Менеджер', 'Олександр', 'Буняк', '+380679999999'),
(10, 3, 'Офіціант', 'Олена', 'Макаренко', '+380671234567'),
(11, 3, 'Шеф-кухар', 'Тарас', 'Макаренко', '+380679876543'),
(12, 3, 'Адміністратор', 'Віталій', 'Вовк', '+380675432123');

-- shifts
INSERT INTO rest_manag.shifts (
    shift_id, location_id, start_datetime, end_datetime
) VALUES
(1, 1, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(2, 2, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(3, 3, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(4, 4, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(5, 5, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(6, 6, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(7, 7, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(8, 8, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(9, 9, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(10, 10, '2026-07-25 08:00:00+03', '2026-07-25 20:00:00+03'),
(11, 1, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(12, 2, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(13, 3, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(14, 4, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(15, 5, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(16, 6, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(17, 7, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(18, 8, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(19, 9, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(20, 10, '2026-07-25 09:00:00+03', '2026-07-25 18:00:00+03'),
(21, 1, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(22, 2, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(23, 3, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(24, 4, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(25, 5, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(26, 6, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(27, 7, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(28, 8, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(29, 9, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(30, 10, '2026-07-26 08:00:00+03', '2026-07-26 20:00:00+03'),
(31, 1, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(32, 2, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(33, 3, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(34, 4, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(35, 5, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(36, 6, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(37, 7, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(38, 8, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(39, 9, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(40, 10, '2026-07-26 09:00:00+03', '2026-07-26 18:00:00+03'),
(41, 1, '2026-07-27 09:00:00+03', '2026-07-27 18:00:00+03'); -- For DELETE example

-- staff_shifts
INSERT INTO rest_manag.staff_shifts (
    staff_id, shift_id
) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 11),
(1, 21),
(2, 21),
(3, 21),
(4, 31),
(5, 2),
(6, 2),
(7, 2),
(8, 12),
(5, 22),
(6, 22),
(7, 22),
(8, 32),
(9, 3),
(10, 3),
(11, 3),
(12, 13),
(9, 23),
(10, 23),
(11, 23),
(12, 33);

--UPDATE examples
-- Changes phone number of employee
UPDATE rest_manag.staff 
SET phone_number = '+380999999999'
WHERE staff_id = (
    SELECT staff_id FROM rest_manag.staff
    WHERE phone_number = '+380673333333' 
    AND first_name = 'Андрій' 
    AND staff_role = 'Шеф-кухар'
);

-- Changes locations address
UPDATE rest_manag.locations
SET 
    street = 'вул. Мечникова, 9', 
    postal_code = '01133'
WHERE location_id = (
    SELECT location_id FROM rest_manag.locations
    WHERE location_name = 'Київ Центр'
);

-- DELETE examples
-- Deletes shifts
DELETE FROM rest_manag.shifts
WHERE shift_id = 41;

--END BRYTAN VITALII


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
INSERT INTO rest_manag.location_ingredients (location_id, ingredient_id, stock_quantity) VALUES 
(1, 1, 2000),
(2, 6, 600),
(3, 8, 100),
(4, 19, 3000),
(5, 33, 220),
(6, 31, 1000),
(7, 7, 500),
(8, 9, 800),
(9, 15, 200),
(10, 18, 600);


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

--BUTRYN IVAN
--Suppliers
INSERT INTO rest_manag.suppliers (supplier_id, supplier_name, country, city, street_address)
VALUES
(1, 'Baltic Trade Solutions', 'Germany', 'Berlin', 'Alexanderplatz 12'),
(2, 'EuroFresh Supply', 'France', 'Paris', 'Rue de Rivoli 45'),
(3, 'NovaDistribution Group', 'Ukraine', 'Kyiv', 'Khreshchatyk 22'),
(4, 'Green Valley Foods', 'USA', 'Chicago', 'Michigan Avenue 150'),
(5, 'Prime Logistics Partner', 'Poland', 'Warsaw', 'Marszałkowska 78'),
(6, 'SilverLine Imports', 'Hungary', 'Budapest', 'Andrássy út 56'),
(7, 'NorthStar Wholesale', 'USA', 'New York', 'Broadway 210'),
(8, 'GlobalMarket Suppliers', 'Poland', 'Kraków', 'Floriańska 31'),
(9, 'FreshWay Trading', 'Germany', 'Hamburg', 'Mönckebergstraße 18'),
(10, 'Horizon Supply Chain', 'USA', 'Los Angeles', 'Sunset Boulevard 325'),
(11, 'TradeSolution', 'USA', 'Washington', 'Sunrise Boulevard 999');

--Inventory
INSERT INTO rest_manag.inventory (
    ingredient_id,
    supplier_id,
    location_id,
    quantity,
    unit_cost,
    purchase_date,
    expiration_date
) VALUES
(35, 1, 1, 25.00, 8.50, '2026-07-01', '2026-07-10'),
(36, 2, 2, 15.00, 4.20, '2026-07-02', '2026-08-02'),
(37, 3, 3, 40.00, 1.50, '2026-07-03', '2026-07-20'),
(38, 4, 4, 20.00, 12.00, '2026-07-04', '2026-07-25'),
(39, 5, 5, 18.00, 18.50, '2026-07-05', '2026-07-20'),
(40, 6, 6, 30.00, 10.00, '2026-07-06', '2026-07-18'),
(41, 7, 7, 22.00, 14.50, '2026-07-07', '2026-08-07'),
(42, 8, 8, 35.00, 2.80, '2026-07-08', '2026-09-08'),
(43, 9, 9, 28.00, 5.20, '2026-07-09', '2026-07-22'),
(44, 10, 10, 16.00, 3.90, '2026-07-10', '2026-07-17');

--Supplier_contacts

INSERT INTO rest_manag.supplier_contacts (
    supplier_id,
    contact_name,
    phone_number,
    email
) VALUES
(1, 'Hans Mueller', '+49 301234567', 'h.mueller@baltictrade.com'),
(2, 'Pierre Dubois', '+33 145678901', 'p.dubois@eurofresh.com'),
(3, 'Oleksandr Kovalenko', '+380 671112233', 'o.kovalenko@novadistribution.ua'),
(4, 'John Smith', '+1 3125550101', 'j.smith@greenvalleyfoods.com'),
(5, 'Piotr Nowak', '+48 501234567', 'p.nowak@primelogistics.pl'),
(6, 'Gabor Nagy', '+36 201112233', 'g.nagy@silverline.hu'),
(7, 'Michael Johnson', '+1 2125550202', 'm.johnson@northstar.com'),
(8, 'Anna Kowalska', '+48 502345678', 'a.kowalska@globalmarket.pl'),
(9, 'Klaus Becker', '+49 401234567', 'k.becker@freshway.de'),
(10, 'Emily Davis', '+1 3235550303', 'e.davis@horizonsupply.com');

--UPDATE

UPDATE rest_manag.suppliers
SET street_address = 'Another Street 32'
WHERE supplier_id = 3
AND supplier_name = 'NovaDistribution Group';

UPDATE rest_manag.inventory
SET quantity = 1000
WHERE ingredient_id = 35;

UPDATE rest_manag.supplier_contacts
SET email = 'example.mail@mail.com'
WHERE supplier_id = 9
AND contact_name = 'Klaus Becker';

--DELETE 
 DELETE FROM rest_manag.suppliers
 WHERE supplier_id = 11;

 --END BUTRYN IVAN


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

-- IVANNIKOV MYKHAILO

-- orders

    -- possible status: New, Preparing, Ready, Delivery, Comleted, Cancelled
    -- possible types: Dine-in, Takeout, Delivery
    -- order_numer is not necessarily unique, it can repeat in different locations

INSERT INTO rest_manag.orders (
    order_number, 
    order_type, 
    order_status, 
    created_at, 
    location_id, 
    customer_id
) VALUES 
(
    1, 
    'Takeout', 
    'Completed',
    '2026-05-01 14:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Київ Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000007'
    )

),(
    2, 
    'Delivery', 
    'Cancelled',
    '2026-07-10 15:00:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Одеса Порт'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000005'
    )

),(
    3, 
    'Delivery', 
    'Completed',
    '2026-07-10 19:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Харків Центральний'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000007'
    )

),(
    4, 
    'Dine-in', 
    'Completed',
    '2026-07-22 15:58:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Харків Центральний'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000003'
    )

),(
    5, 
    'Takeout', 
    'Preparing',
    '2026-07-30 14:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Харків Центральний'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000002'
    )

),(
    6, 
    'Delivery', 
    'Preparing',
    '2026-07-30 12:33:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Вінниця Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000009'
    )

),(
    7, 
    'Dine-in', 
    'Completed',
    '2026-07-29 12:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Запоріжжя Молл'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000004'
    )

),(
    1, 
    'Takeout', 
    'Preparing',
    '2026-07-30 17:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Полтава Маркет'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000005'
    )

),(
    3, 
    'Delivery', 
    'Completed',
    '2026-07-28 14:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Дніпро Сіті'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000007'
    )

),(
    112, 
    'Delivery', 
    'New',
    '2026-07-30 16:25:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Чернігів Плаза'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000004'
    )

),(
    25, 
    'Takeout', 
    'Ready',
    '2026-07-30 14:30:00+03', 
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Івано-Франківськ Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000006'
    )

);

INSERT INTO rest_manag.tables (
    table_number, 
    capacity, 
    location_id
) VALUES
(
    1,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Івано-Франківськ Центр'
    )
),(
    2,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Івано-Франківськ Центр'
    )
),(
    1,
    2,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Запоріжжя Молл'
    )
),(
    1,
    2,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Львів Плаза'
    )
),(
    1,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Київ Центр'
    )
),(
    2,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Київ Центр'
    )
),(
    1,
    2,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Одеса Порт'
    )
),(
    2,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Одеса Порт'
    )
),(
    1,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Чернігів Плаза'
    )
),(
    2,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Чернігів Плаза'
    )
),(
    3,
    2,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Чернігів Плаза'
    )
),(
    1,
    4,
    (
        SELECT location_id 
        FROM rest_manag.locations
        WHERE location_name = 'Харків Центральний'
    )
);

-- reservations
-- possible reservation status Pending, Confirmed, Seated, Cancelled

INSERT INTO rest_manag.reservations (
    reservation_time,
    reservation_date,
    reservation_status,
    location_id,
    customer_id
) VALUES
(
    '12:30:00',
    '2026-07-30',
    'Pending',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Івано-Франківськ Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000006'
    )
),(
    '16:45:00',
    '2026-07-30',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Івано-Франківськ Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000007'
    )
),(
    '16:45:00',
    '2026-07-30',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Івано-Франківськ Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000007'
    )
),(
    '17:30:00',
    '2026-07-30',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Київ Центр'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000005'
    )
),(
    '18:20:00',
    '2026-07-30',
    'Seated',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Одеса Порт'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000006'
    )
),(
    '11:45:00',
    '2026-07-29',
    'Cancelled',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Одеса Порт'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000006'
    )
),(
    LOCALTIME + INTERVAL '1 hour',
    CURRENT_DATE,
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Харків Центральний'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000006'
    )
),(
    LOCALTIME + INTERVAL '2 hour',
    CURRENT_DATE,
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Запоріжжя Молл'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000002'
    )
),(
    LOCALTIME + INTERVAL '2 hour',
    CURRENT_DATE + INTERVAL '1 day',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Запоріжжя Молл'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000002'
    )
),(
    LOCALTIME,
    CURRENT_DATE + INTERVAL '2 day',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Запоріжжя Молл'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000003'
    )
),(
    LOCALTIME + INTERVAL '2 hour',
    CURRENT_DATE + INTERVAL '2 day',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Львів Плаза'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000007'
    )
),(
    LOCALTIME + INTERVAL '2 hour',
    CURRENT_DATE + INTERVAL '2 day',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Запоріжжя Молл'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000005'
    )
),(
    LOCALTIME - INTERVAL '2 hour',
    CURRENT_DATE + INTERVAL '2 day',
    'Confirmed',
    (
        SELECT location_id 
        FROM rest_manag.locations 
        WHERE location_name = 'Харків Центральний'
    ),
    (
        SELECT customer_id
        FROM rest_manag.customers
        WHERE phone_number = '+380000000006'
    )
);

-- tables_reservation
-- will automatically assign a table for a reservation based on the location
-- cannot select a table which is reserved for +- 10 minutes from specific reservation time

INSERT INTO rest_manag.tables_reservation (table_id, reservation_id) 
	SELECT DISTINCT ON (r.reservation_id) t.table_id, r.reservation_id FROM rest_manag.tables 
	AS t INNER JOIN  rest_manag.reservations AS r
	ON t.location_id = r.location_id 
	WHERE r.reservation_status = 'Confirmed' AND 
	NOT EXISTS (
		SELECT 1 FROM rest_manag.tables_reservation AS tr
		INNER JOIN rest_manag.reservations AS res ON 
		tr.reservation_id = res.reservation_id 
		WHERE tr.table_id = t.table_id
		AND res.reservation_date = r.reservation_date
		AND res.reservation_status = 'Confirmed'
		AND res.reservation_time BETWEEN
		(r.reservation_time - interval '10 minutes') AND
		(r.reservation_time + interval '10 minutes'));

-- order_item 

INSERT INTO rest_manag.order_item (
    order_id, 
    item_id, 
    quantity
) VALUES 
(1, 2, 1),
(1, 3, 1),
(1, 4, 2),
(2, 5, 2),
(3, 4, 1),
(3, 5, 3),
(4, 6, 1),
(4, 4, 3),
(5, 5, 2),
(5, 4, 2),
(6, 4, 2),
(7, 1, 1),
(8, 2, 2),
(9, 6, 2),
(10, 8, 1);

-- UPDATE example:
-- set all outdated reservations which are not marked as seated as cancelled. (outdated is compared to current time with 5 min interval)

UPDATE rest_manag.reservations SET reservation_status = 'Cancelled'
WHERE reservation_status <> 'Seated' 
AND reservation_status <> 'Cancelled' 
AND (
    
    reservation_date < CURRENT_DATE 

    OR (
        reservation_date = CURRENT_DATE AND 
        reservation_time  + interval '5 minutes' < CURRENT_TIME
    )
);



-- DELETE example:
-- delete reservation history older than month

DELETE FROM rest_manag.reservations WHERE reservation_date < CURRENT_DATE - interval '1 month'; 

-- DELETE example:
-- delete history of cancelled or completed orders more then month ago 

DELETE FROM rest_manag.orders WHERE order_status IN ('Cancelled', 'Completed') and CAST ( created_at AS DATE ) < CURRENT_DATE - interval '1 month';

-- UPDATE example:
-- update status of an exact order to Confirmed
UPDATE rest_manag.orders SET order_status = 'Confirmed' WHERE order_number = 3;

-- END Ivannikov Mykhailo
