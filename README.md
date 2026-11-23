# MySQL Data Analysis Practice & Business Challenges

> **Note:** This repository documents my hands-on **MySQL learning progression**—combining database schema initialization (`Parks_and_Rec_Create_db.sql`), structured exercises (`BEGINNER`, `INTERMEDIATE`, `ADVANCE`), personal study notes (`Mysql_Notes.pdf`), and independent problem solving challenges using the `Parks_and_Recreation` relational schema.

---

### 🎯 Learning & Practice Methodology
To move beyond passively following tutorials and build real problem solving fluency, I structured my SQL training into two stages:

1. **Guided Curriculum (`BEGINNER/`, `INTERMEDIATE/`, `ADVANCE/`):**
   - Based on the **MySQL playlist from Alex The Analyst's Data Analyst Bootcamp**, covering core querying through advanced database automation (`Parks_and_Recreation` schema).
   - Accompanied by my own illustrated reference guide (`Mysql_Notes.pdf`) documenting syntax rules, execution order, and query result grids.
2. **AI Assisted Problem First Challenges (`CHALLENGES/`):**
   - **Where the Problems Came From:** After completing each lesson module, I used **AI as a learning and mentoring tool** to generate realistic, multi condition business scenarios tailored to the concepts I had just studied—without providing SQL hints or tutorial steps.
   - **How I Solved & Verified My Work:** I translated each business problem into SQL independently from scratch, executed the queries in **MySQL Workbench** to verify the output rows and edge cases against the business conditions, and used AI afterward strictly for **code review, logic validation, and optimization feedback**. Every query in `CHALLENGES/` preserves my original implementation.

---

### 📂 Repository Structure

#### 0. Root Reference & Setup Files
- **`Parks_and_Rec_Create_db.sql`:** Creates and populates the `Parks_and_Recreation` MySQL database (`employee_demographics`, `employee_salary`, and `parks_departments`) so all lesson and challenge scripts can be executed out of the box.
- **`Mysql_Notes.pdf`:** Illustrated MySQL study guide covering query syntax, execution order, join behavior, string manipulation, conditional `CASE` logic, and subqueries with result grid outputs.

#### 1. `BEGINNER/` — SQL Foundations (`LESSON 1` – `LESSON 4`)
- **`LESSON 1.sql`:** `SELECT`, column aliasing (`AS`), `DISTINCT`, `WHERE`, logical operators (`AND`, `OR`, `NOT`), and pattern matching (`LIKE` with `%` and `_`).
- **`LESSON 2.sql`:** `GROUP BY`, aggregate functions (`AVG`, `MAX`, `MIN`, `COUNT`), and `ORDER BY` (`ASC` / `DESC`).
- **`LESSON 3.sql`:** Filtering row level records with `WHERE` vs. filtering aggregated groups with `HAVING`.
- **`LESSON 4.sql`:** Result pagination and top N queries using `LIMIT` and offset parameters.

#### 2. `INTERMEDIATE/` — Relational Querying & Transformations (`LESSON 5` – `LESSON 10`)
- **`LESSON 5.sql`:** `INNER JOIN`, `LEFT/RIGHT OUTER JOIN`, `SELF JOIN`, and multi table joins across `employee_demographics`, `employee_salary`, and `parks_departments`.
- **`LESSON 6.sql`:** Combining result sets with `UNION DISTINCT` and `UNION ALL`, plus multi condition filtered aggregations.
- **`LESSON 7.sql`:** String manipulation (`LENGTH`, `UPPER`, `LOWER`, `TRIM`, `LTRIM`, `RTRIM`, `LEFT`, `RIGHT`, `SUBSTRING`, `REPLACE`, `LOCATE`, `CONCAT`).
- **`LESSON 8.sql`:** Conditional business logic using `CASE` statements (age brackets, merit salary increases, and department bonuses).
- **`LESSON 9.sql`:** Nested subqueries inside `WHERE`, `SELECT`, and `FROM` clauses.
- **`LESSON 10.sql`:** Window functions (`OVER`, `PARTITION BY`, rolling `SUM`, `ROW_NUMBER`, `RANK`, and `DENSE_RANK`).

#### 3. `ADVANCE/` — Modular & Automated SQL (`LESSON 11` – `LESSON 14`)
- **`LESSON 11.sql`:** Single and multi step Common Table Expressions (`WITH` / `CTEs`).
- **`LESSON 12.sql`:** Creating and querying session scoped `TEMPORARY TABLES`.
- **`LESSON 13.sql`:** Reusable `STORED PROCEDURES` with custom `DELIMITER` blocks and input parameters.
- **`LESSON 14.sql`:** Automated `AFTER INSERT` `TRIGGERS` and scheduled `EVENTS`.

#### 4. `CHALLENGES/` — Independent Problem Solving Queries
Custom analytical prompts solved independently without walkthroughs—translating multi condition business requirements into clean multi table joins, CTEs, and filtered reports:
- **`PRACTICE 1_2.sql`:** Leadership compensation benchmarking, department headcount/pay analysis, mid to senior workforce demographics, and payroll spread audits (`WHERE`, `LIKE`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`).
- **`PRATICE2_2.sql`:** Multi table departmental workforce summaries and cross departmental retention/executive audit rosters (`INNER JOIN`, `RIGHT OUTER JOIN`, `UNION ALL`).
- **`PRACTICE 4_2.sql`:** Company wide pay variance audits, departmental pay gap investigations, and row level running averages, cumulative payroll, and dense salary rankings (Subqueries & Window Functions).
- **`PRACTICE 5_2.sql`:** Departmental salary benchmarking, tier 1 earner isolation, parameterized salary/department procedures, automated new hire payroll audit logging, and scheduled retirement/retention watchlists (`CTEs`, `Temporary Tables`, `Stored Procedures`, `Trigger`, `Events`).

---

### 🚀 How to Run
1. Run `Parks_and_Rec_Create_db.sql` in MySQL Workbench to initialize the `Parks_and_Recreation` schema and seed records.
2. Open and execute any script inside `BEGINNER/`, `INTERMEDIATE/`, `ADVANCE/`, or `CHALLENGES/` to inspect the query results.
