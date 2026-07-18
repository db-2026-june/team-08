-- ================================================================
-- SQL DDL TEMPLATE (TOPIC 04)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) Full PostgreSQL DDL for your finalized schema.
-- 2) CREATE TABLE statements for all entities from your ER diagram.
-- 3) Primary keys, foreign keys, NOT NULL, UNIQUE, CHECK constraints.
-- 4) Indexes for important search/join columns.
-- 5) Clean structure and comments (group by tables/constraints/indexes).
--
-- RECOMMENDED ORDER:
-- 1) Tables
-- 2) Constraints (if not inline)
-- 3) Indexes
--
-- TEAM NOTE:
-- Add short attribution comments for who implemented which part.
-- Example:
-- [Name] - users, roles, permissions tables
-- [Name] - orders, payments, invoices tables
--
-- IMPORTANT:
-- The script must run in PostgreSQL and produce a working schema that
-- matches your approved ER diagram and conceptual schema.
-- Submit this as one SQL file.
-- ================================================================
-- Add your DDL below this line

-- [BrytanVitalii] - locations, staff, staff_shifts, shifts and indices
-- [Khrystyna] - ingredients, menu_categories, menu_items, menu_ingredients tables and indices
-- [Shyshka Tymofii] - customers, reviews tables and indices

CREATE SCHEMA rest_manag;

-- [BrytanVitalii]
CREATE TABLE rest_manag.locations (
    location_id bigserial PRIMARY KEY,
    location_name varchar(100) NOT NULL,
    street varchar(150) NOT NULL,
    city varchar(100) NOT NULL,
    state_province varchar(100),
    postal_code varchar(20),
    country varchar(100) NOT NULL,
    phone_number varchar(20)
);

CREATE TABLE rest_manag.staff(
    staff_id bigserial PRIMARY KEY,
    location_id bigint NOT NULL REFERENCES rest_manag.locations(location_id),
    staff_role varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    phone_number varchar(20)
);

CREATE TABLE rest_manag.shifts(
  shift_id bigserial PRIMARY KEY,
  location_id bigint NOT NULL REFERENCES rest_manag.locations(location_id),
  start_datetime timestamptz NOT NULL,
  end_datetime timestamptz NOT NULL,

  CHECK (end_datetime > start_datetime)
);

CREATE TABLE rest_manag.staff_shifts(
  staff_id bigint NOT NULL REFERENCES rest_manag.staff(staff_id) ON DELETE CASCADE,
  shift_id bigint NOT NULL REFERENCES rest_manag.shifts(shift_id) ON DELETE CASCADE,

  PRIMARY KEY (staff_id, shift_id)
);

-- [Khrystyna]
CREATE TABLE rest_manag.ingredients(
  ingredient_id bigserial PRIMARY KEY,
  ingredient_name varchar(50) NOT NULL,
  unit varchar(20) NOT NULL
);


CREATE TABLE rest_manag.menu_categories (
  category_id bigserial PRIMARY KEY, 
  category_name varchar(50) NOT NULL
);


CREATE TABLE rest_manag.menu_items (
  item_id bigserial PRIMARY KEY,
  dish_name varchar(100) NOT NULL,
  price decimal(8,2) NOT NULL CHECK (price > 0),
  preparation_time int NOT NULL CHECK (preparation_time > 0),
  category_id bigint NOT NULL 
    REFERENCES rest_manag.menu_categories(category_id)
);


CREATE TABLE rest_manag.menu_ingredients(
  ingredient_id bigint NOT NULL 
    REFERENCES rest_manag.ingredients(ingredient_id),
  
  item_id bigint NOT NULL 
    REFERENCES rest_manag.menu_items(item_id),
  
  quantity decimal(8,2) NOT NULL CHECK (quantity > 0),

  PRIMARY KEY (ingredient_id, item_id)
);

CREATE TABLE rest_manag.location_ingredients (
  location_id bigint NOT NULL
  REFERENCES rest_manag.locations(location_id),
  ingredient_id bigint NOT NULL
  REFERENCES rest_manag.ingredients (ingredient_id),
  stock_quantity decimal(8,2) NOT NULL CHECK (stock_quantity >= 0),

  PRIMARY KEY (location_id, ingredient_id)
);

-- [Shyshka Tymofii]
CREATE TABLE rest_manag.customers (
    customer_id bigserial,

    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(255) NOT NULL,
    phone_number varchar(30),
    created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_customers
        PRIMARY KEY (customer_id),

    CONSTRAINT uq_customers_email
        UNIQUE (email)
);


CREATE TABLE rest_manag.reviews (
    review_id bigserial,

    customer_id bigint NOT NULL,
    location_id bigint NOT NULL,
    rating smallint NOT NULL,
    comment text,
    review_date timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_reviews
        PRIMARY KEY (review_id),

    CONSTRAINT fk_reviews_customer
        FOREIGN KEY (customer_id)
        REFERENCES rest_manag.customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_reviews_location
        FOREIGN KEY (location_id)
        REFERENCES rest_manag.locations(location_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_reviews_rating
        CHECK (rating BETWEEN 1 AND 5)
);

-- indices
CREATE INDEX idx_staff_location
ON rest_manag.staff(location_id);

CREATE INDEX idx_shifts_location
ON rest_manag.shifts(location_id);

CREATE INDEX idx_menu_items_category
ON rest_manag.menu_items(category_id);

CREATE INDEX idx_location_ingredients_location
ON rest_manag.location_ingredients(location_id);

CREATE INDEX idx_reviews_customer
ON rest_manag.reviews(customer_id);

CREATE SCHEMA rest_manag;

-- [BrytanVitalii]
CREATE TABLE rest_manag.locations (
    location_id bigserial PRIMARY KEY,
    location_name varchar(100) NOT NULL,
    street varchar(150) NOT NULL,
    city varchar(100) NOT NULL,
    state_province varchar(100),
    postal_code varchar(20),
    country varchar(100) NOT NULL,
    phone_number varchar(20)
);

CREATE TABLE rest_manag.staff(
    staff_id bigserial PRIMARY KEY,
    location_id bigint NOT NULL REFERENCES rest_manag.locations(location_id),
    staff_role varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    phone_number varchar(20)
);

CREATE TABLE rest_manag.shifts(
  shift_id bigserial PRIMARY KEY,
  location_id bigint NOT NULL REFERENCES rest_manag.locations(location_id),
  start_datetime timestamptz NOT NULL,
  end_datetime timestamptz NOT NULL,

  CHECK (end_datetime > start_datetime)
);

CREATE TABLE rest_manag.staff_shifts(
  staff_id bigint NOT NULL REFERENCES rest_manag.staff(staff_id) ON DELETE CASCADE,
  shift_id bigint NOT NULL REFERENCES rest_manag.shifts(shift_id) ON DELETE CASCADE,

  PRIMARY KEY (staff_id, shift_id)
);

-- [Khrystyna]
CREATE TABLE rest_manag.ingredients(
  ingredient_id bigserial PRIMARY KEY,
  ingredient_name varchar(50) NOT NULL,
  unit varchar(20) NOT NULL
);


CREATE TABLE rest_manag.menu_categories (
  category_id bigserial PRIMARY KEY, 
  category_name varchar(50) NOT NULL
);


CREATE TABLE rest_manag.menu_items (
  item_id bigserial PRIMARY KEY,
  dish_name varchar(100) NOT NULL,
  price decimal(8,2) NOT NULL CHECK (price > 0),
  preparation_time int NOT NULL CHECK (preparation_time > 0),
  category_id bigint NOT NULL 
    REFERENCES rest_manag.menu_categories(category_id)
);


CREATE TABLE rest_manag.menu_ingredients(
  ingredient_id bigint NOT NULL 
    REFERENCES rest_manag.ingredients(ingredient_id),
  
  item_id bigint NOT NULL 
    REFERENCES rest_manag.menu_items(item_id),
  
  quantity decimal(8,2) NOT NULL CHECK (quantity > 0),

  PRIMARY KEY (ingredient_id, item_id)
);

CREATE TABLE rest_manag.location_ingredients (
  location_id bigint NOT NULL
  REFERENCES rest_manag.locations(location_id),
  ingredient_id bigint NOT NULL
  REFERENCES rest_manag.ingredients (ingredient_id),
  stock_quantity decimal(8,2) NOT NULL CHECK (stock_quantity >= 0),

  PRIMARY KEY (location_id, ingredient_id)
);

-- [Butryn Ivan]
CREATE TABLE rest_manag.ingredients (
    ingredient_id bigserial PRIMARY KEY,
    ingredient_name varchar(100) NOT NULL,
    unit varchar(30) NOT NULL
);

CREATE TABLE rest_manag.suppliers (
    supplier_id bigserial PRIMARY KEY,
    supplier_name varchar(150) NOT NULL,
    country varchar(100),
    city varchar(100),
    street_address varchar(255)
);

CREATE TABLE rest_manag.supplier_contacts (
    contact_id bigserial PRIMARY KEY,
    supplier_id bigint NOT NULL,
    contact_name varchar(100) NOT NULL,
    phone_number varchar(20),
    email varchar(150),

    CONSTRAINT fk_supplier_contacts_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES rest_manag.suppliers(supplier_id)
);

-- [Shyshka Tymofii]
CREATE TABLE rest_manag.customers (
    customer_id bigserial,

    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(255) NOT NULL,
    phone_number varchar(30),
    created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_customers
        PRIMARY KEY (customer_id),

    CONSTRAINT uq_customers_email
        UNIQUE (email)
);


CREATE TABLE rest_manag.reviews (
    review_id bigserial,

    customer_id bigint NOT NULL,
    location_id bigint NOT NULL,
    rating smallint NOT NULL,
    comment text,
    review_date timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_reviews
        PRIMARY KEY (review_id),

    CONSTRAINT fk_reviews_customer
        FOREIGN KEY (customer_id)
        REFERENCES rest_manag.customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_reviews_location
        FOREIGN KEY (location_id)
        REFERENCES rest_manag.locations(location_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_reviews_rating
        CHECK (rating BETWEEN 1 AND 5)
);

-- indices
CREATE INDEX idx_staff_location
ON rest_manag.staff(location_id);

CREATE INDEX idx_shifts_location
ON rest_manag.shifts(location_id);

CREATE INDEX idx_menu_items_category
ON rest_manag.menu_items(category_id);

CREATE INDEX idx_location_ingredients_location
ON rest_manag.location_ingredients(location_id);

CREATE INDEX idx_supplier_contacts_supplier
ON rest_manag.supplier_contacts(supplier_id);

CREATE INDEX idx_reviews_customer
ON rest_manag.reviews(customer_id);

CREATE INDEX idx_reviews_location
ON rest_manag.reviews(location_id);
