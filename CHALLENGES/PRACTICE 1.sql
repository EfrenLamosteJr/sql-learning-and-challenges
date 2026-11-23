-- CHALLENGE 1: Leadership Compensation Benchmarking
-- Business Problem:
-- Human Resources is benchmarking compensation across leadership and strategic planning roles to identify the highest-paid management tracks in the organization. We need a summary of
-- average salaries by job title for core leadership positions, excluding entry-level or support roles, so leadership can review top-tier compensation tiers.
-- Conditions:
--  Include only employees whose occupation contains "manager", "director", or "planner".
--  Exclude any roles containing "assistant".
--  Consider only employees earning at least $50,000.
--  Group the results by occupation and include only titles with an average salary above $60,000.
--  Sort from highest to lowest average salary and return only the top 2 roles.
-- -

-- SQL Concepts I use: WHERE, LIKE / NOT LIKE, Parentheses Logic, GROUP BY, AVG, HAVING, ORDER BY, LIMIT
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE (occupation like "%manager%" or occupation like "%director%" or occupation like "%planner%") AND salary >= 50000 AND occupation  NOT LIKE "%assistant%"
GROUP BY occupation
HAVING AVG(salary) > 60000
ORDER BY AVG(salary) DESC
LIMIT 2
;	

--
-- CHALLENGE 2: Department Leadership Headcount & Salary Analysis
-- Business Problem:
-- Finance and Executive Management want to evaluate how leadership payroll is distributed across
-- departments rather than individual job titles. By analyzing department-level leadership headcount
-- and average pay, leadership can identify which departments carry the highest concentration of
-- senior decision-makers.

-- Conditions:
-- * Filter for employees in "manager", "director", or "planner" roles, excluding any "assistant" titles.
-- * Include only employees earning $50,000 or more.
-- * Group the data by department ID (`dept_id`) to calculate average salary and leadership headcount.
-- * Keep only departments where the average leadership salary exceeds $60,000.
-- * Rank departments from highest to lowest average salary and display the top 2.
--

-- SQL Concepts: WHERE, LIKE / NOT LIKE, GROUP BY, AVG, COUNT, HAVING, ORDER BY, LIMIT
SELECT dept_id, AVG(salary), COUNT(*) AS employee_count
FROM employee_salary
WHERE (occupation like "%manager%" or occupation like "%director%" or occupation like "%planner%") AND salary >= 50000 AND occupation  NOT LIKE "%assistant%"
GROUP BY dept_id
HAVING AVG(salary) > 60000
ORDER BY AVG(salary) DESC
LIMIT 2
;

-- CHALLENGE 3: Mid-to-Senior Workforce Demographic Breakdown
-- Business Problem:
-- As part of long-term workforce succession planning, HR needs a demographic profile of experienced,
-- active-age employees segmented by gender. Understanding the age distribution and headcount within
-- this cohort helps identify potential retirement pipelines and leadership readiness across teams.
--
-- Conditions:
--  Include employees who are at least 40 years old OR were born before January 1, 1985.
--  Exclude employees aged 60 and above.
--  Group the results by gender and compute total headcount, average age, youngest age, and oldest age.
--  Include only gender groups with at least 2 employees and an average age above 40.
--  Sort by oldest age descending, then average age descending, and limit the output to 2 rows

-- SQL Concept i use: WHERE, Date Comparison, GROUP BY, COUNT, AVG, MIN, MAX, HAVING, ORDER BY, LIMIT
SELECT gender, count(*) AS employee_count, AVG(age) AS avg_age, MIN(age) AS youngest_age, MAX(age) AS oldest_age 
FROM employee_demographics
WHERE ((age >= 40 OR birth_date < '1985-1-1') AND (age < 60))
GROUP BY gender
HAVING count(*) >= 2 AND avg_age > 40
ORDER BY oldest_age DESC, avg_age DESC
LIMIT 2
;

--
-- CHALLENGE 4: Departmental Payroll Spread & Minimum Floor Audit
-- Business Problem:
-- Budget analysts are auditing departmental compensation ranges to spot departments with strong
-- upper-tier salaries alongside lower entry floors. Identifying departments with high peak salaries
-- and notable pay spreads helps guide upcoming salary band adjustments and budget allocations.

-- Conditions:
--  Include employees earning at least $50,000 OR holding a "manager" title, while excluding assistant roles.
--  Group by department ID (`dept_id`) and calculate employee count, average salary, highest salary, and lowest salary.
--  Filter for departments with at least 2 qualifying employees, an average salary above $60,000, and a maximum salary above $70,000.
--  Sort by lowest salary ascending, then average salary ascending, and return the top 2 departments.
--

-- SQL used: WHERE, LIKE / NOT LIKE, GROUP BY, COUNT, AVG, MAX, MIN, HAVING, ORDER BY, LIMIT
SELECT dept_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary, Max(salary) AS highest_salary ,MIN(salary) AS lowest_salary 
FROM employee_salary
WHERE (salary >= 50000	OR occupation LIKE '%manager%') AND occupation NOT LIKE '%assisstant%'
GROUP BY dept_id
HAVING employee_count >= 2 AND avg_salary > 60000 AND highest_salary > 70000
ORDER BY lowest_salary, avg_salary
LIMIT 2
;