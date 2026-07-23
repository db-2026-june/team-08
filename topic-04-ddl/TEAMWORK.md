# TEAMWORK - Topic 04 (SQL DDL)

## Склад команди
- Команда:  team 8
- Варіант предметної області: Restaurant Management System 

## Таблиця внесків
| Учасник | Роль у команді | Що зроблено | Артефакти / файли |
|---|---|---|---|
| Ivan Butryn | відповідальний за менеджмент наступних таблиць: Inventory; Suppliers; Supplier_contacts | Створено таблиці Inventory; Suppliers; Supplier_contacts, опрацьовано звʼязки між ними та іншими частинами бази даних | ddl.sql; TEAMWORK.md |
| Khrystyna Shopiak | була відповідальна за меню та інгредієнти |Створено таблиці: ingredients, menu_ingredients, menu_items, menu_categories, location_ingredients | ddl.sql; TEAMWORK.md |
| ... | ... | ... | ... |

## Контекст теми
Опишіть, хто відповідав за: створення таблиць, PK/FK, constraints, indexes, порядок секцій у `ddl.sql` та перевірку виконання скрипта у PostgreSQL.
Shopiak Khrystyna відповідала за створення таблиць: ingredients, menu_ingredients, menu_items, menu_categories, location_ingredients, та таких PK:  ingredient_id, category_id, item_id, та такі FK: category_id, ingredient_id, item_id та створення індексів idx_menu_items_category, idx_location_ingredients_location.

Перевіряв виконання скрипта у PostgreSQL: Ivan Butryn

## Коротке обґрунтування командного підходу
1. Як ви розподілили DDL-об'єкти між учасниками: DDL-обʼєкти були розподілені між учасниками відповідно до сутностей ER- діаграми
2. Чому обрали саме такий поділ роботи: Такий поділ дозволив паралельно працювати над різними частинами бази даних та уникнути конфліктів під час внесення змін у репозиторій. Кожен учасник відповідав за конкретну групу пов’язаних сутностей, що спростило перевірку структури таблиць та відповідність ER-діаграмі.
3. Як перевіряли відповідність DDL вашій ER-діаграмі: Відповідність перевіряли шляхом порівняння створених таблиць із сутностями та зв’язками на ER-діаграмі. Перевіряли наявність усіх необхідних таблиць, primary keys, foreign keys, типів зв’язків (one-to-many та many-to-many), а також відповідність назв колонок і атрибутів. Додатково виконували перевірку SQL-скриптів у PostgreSQL для виявлення помилок у створенні таблиць та зв’язків.
