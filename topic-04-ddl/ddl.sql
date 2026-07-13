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
CREATE SCHEMA rest_manag;

-- [BrytanVitalii] - locations, staff, staff_shifts, shifts, 
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
  staff_id bigint REFERENCES rest_manag.staff(staff_id),
  shift_id bigint REFERENCES rest_manag.shifts(shift_id),

  PRIMARY KEY (staff_id, shift_id)
);

CREATE INDEX idx_staff_location
ON rest_manag.staff(location_id);

CREATE INDEX idx_shifts_location
ON rest_manag.shifts(location_id);