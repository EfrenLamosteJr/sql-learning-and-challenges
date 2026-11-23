# MySQL Data Analysis Practice & Business Challenges

> **Note:** This repository documents my hands-on **MySQL learning progression**—combining database schema initialization, structured exercises (`BEGINNER`, `INTERMEDIATE`, `ADVANCE`), personal study notes, and independent problem-solving challenges using the `Parks_and_Recreation` relational schema.

---

### 📂 Repository Structure

#### 0. `Parks_and_Rec_Create_db.sql` — Database Setup
Creates and populates the `Parks_and_Recreation` MySQL database (`employee_demographics`, `employee_salary`, and `parks_departments`) so all lesson and challenge scripts can be executed out of the box.

#### 1. `BEGINNER/` — SQL Foundations (`LESSON 1` – `LESSON 4`)
* **`LESSON 1.sql`:** `SELECT`, column aliasing (`AS`), `DISTINCT`, `WHERE`, logical operators (`AND`, `OR`, `NOT`), and pattern matching (`LIKE` with `%` and `_`).
* **`LESSON 2.sql`:** `GROUP BY`, aggregate functions (`AVG`, `MAX`, `MIN`, `COUNT`), and `ORDER BY` (`ASC` / `DESC`).
* **`LESSON 3.sql`:** Filtering row-level records with `WHERE` vs. filtering aggregated groups with `HAVING`.
* **`LESSON 4.sql`:** Result pagination and top-N queries using `LIMIT` and offset parameters.

#### 2. `INTERMEDIATE/` — Relational Querying & Transformations (`LESSON 5` – `LESSON 10`)
* **`LESSON 5.sql`:** `INNER JOIN`, `LEFT/RIGHT OUTER JOIN`, `SELF JOIN`, and multi-table joins across `employee_demographics`, `employee_salary`, and `parks_departments`.
* **`LESSON 6.sql`:** Combining result sets with `UNION DISTINCT` and `UNION ALL`, plus multi-condition filtered aggregations.
* **`LESSON 7.sql`:** String manipulation (`LENGTH`, `UPPER`, `LOWER`, `TRIM`, `LTRIM`, `RTRIM`, `LEFT`, `RIGHT`, `SUBSTRING`, `REPLACE`, `LOCATE`, `CONCAT`).
* **`LESSON 8.sql`:** Conditional business logic using `CASE` statements (age brackets, merit salary increases, and department bonuses).
* **`LESSON 9.sql`:** Nested subqueries inside `WHERE`, `SELECT`, and `FROM` clauses.
* **`LESSON 10.sql`:** Window functions (`OVER`, `PARTITION BY`, rolling `SUM`, `ROW_NUMBER`, `RANK`, and `DENSE_RANK`).

#### 3. `ADVANCE/` — Modular & Automated SQL (`LESSON 11` – `LESSON 14`)
* **`LESSON 11.sql`:** Single and multi step Common Table Expressions (`WITH` / `CTEs`).
* **`LESSON 12.sql`:** Creating and querying session-scoped `TEMPORARY TABLES`.
* **`LESSON 13.sql`:** Reusable `STORED PROCEDURES` with custom `DELIMITER` blocks and input parameters.
* **`LESSON 14.sql`:** Automated `AFTER INSERT` `TRIGGERS` and scheduled `EVENTS`.

#### 4. `CHALLENGES/` — Independent Problem-Solving Queries *(Coming Soon)*
Custom analytical prompts solved independently without walkthroughs translating multi condition business requirements into clean multi-table joins, CTEs, and filtered reports.

---

### 🚀 How to Run
1. Run `Parks_and_Rec_Create_db.sql` in MySQL Workbench to initialize the `Parks_and_Recreation` schema and seed records.
2. Open and execute any script inside `BEGINNER/`, `INTERMEDIATE/`, or `ADVANCE/` to inspect the query results.
