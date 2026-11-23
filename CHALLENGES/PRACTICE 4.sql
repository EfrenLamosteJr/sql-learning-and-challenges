-- CHALLENGE 1: Above-Average Compensation & Pay Variance Audit
-- Business Problem:
-- Human Resources is conducting a compensation equity review to identify employees earning
-- above the company-wide average salary and quantify exactly how much each high earner exceeds
-- that benchmark. This visibility helps leadership evaluate top-end payroll distribution.
--
-- Conditions:
--  Calculate the organization-wide average salary using scalar subqueries.
--  Display each qualifying employee's first name, last name, salary, company average salary, and the dollar difference above the average.
--  Filter the results to include only employees whose salary is strictly greater than the company-wide average.
--

-- SQL Concepts I use: Scalar Subqueries (SELECT & WHERE)
SELECT first_name, last_name, salary, (SELECT AVG(salary)
										FROM employee_salary) AS avg_salary2,
										salary -  (SELECT AVG(salary)
										FROM employee_salary) AS above_total
FROM employee_salary
WHERE salary > (SELECT AVG(salary)
					FROM employee_salary)
;

--
-- CHALLENGE 2: Departmental Compensation Benchmarking & Pay Gap Investigation
-- Business Problem:
-- Finance and Executive Management want to evaluate departmental payroll performance from
-- multiple angles: establishing baseline average salaries across named departments, identifying
-- which departments outperform the overall organization average, and auditing department IDs
-- that have high top-end earners alongside lower overall departmental averages.
--
-- Conditions:
--  Step 1: Join salary and department tables to calculate average salary per department name, and inspect the distinct department roster.
--  Step 2: Filter named departments using HAVING and a scalar subquery so only departments exceeding the company-wide average salary are returned, sorted highest to lowest.
--  Step 3: Use a derived table (FROM subquery) grouped by department ID (`dept_id`) to summarize average salary and employee headcount.
--  Step 4: Audit department IDs to isolate any department where the highest salary exceeds $70,000 while the departmental average remains below $65,000.
--

-- SQL Concepts I use: INNER JOIN, GROUP BY, HAVING with Subquery
SELECT department_name, AVG(salary)
FROM employee_salary AS sal
JOIN parks_departments AS dept
		ON sal.dept_id = dept.department_id	
GROUP BY department_name
;

SELECT  department_name
FROM parks_departments
GROUP BY department_name
;

SELECT department_name, AVG(salary) avg_salary
FROM employee_salary AS sal
JOIN parks_departments AS dept
		ON sal.dept_id = dept.department_id
GROUP BY department_name
HAVING avg_salary > (SELECT AVG(salary) FROM employee_salary)
ORDER BY avg_salary DESC
;

SELECT dept_id, AVG(avg_salary) AS avg_salary, employee_count
FROM (SELECT dept_id, AVG(salary) AS avg_salary, COUNT(*) AS employee_count
FROM employee_salary
GROUP BY dept_id) AS dept_salary_avg
GROUP BY dept_id
;

SELECT dept_id, MAX(salary) AS highest_dept_salary, MIN(salary) AS lowest_dept_salary, AVG(salary) AS avg_dept_salary
FROM employee_salary
GROUP BY dept_id
HAVING highest_dept_salary > 70000 AND avg_dept_salary < 65000
;

-- WINDOWS FUNCTION PRACTICE
--
-- CHALLENGE 3: Departmental Running Averages, Cumulative Payroll & Salary Rankings
-- Business Problem:
-- Payroll analysts need row-level analytical views without collapsing individual employee records.
-- Specifically, management wants to track running departmental salary averages, cumulative
-- company payroll ordered by employee ID, and dense salary rankings within each department.
--
-- Conditions:
--  Query 1: Compute a running departmental average salary partitioned by `dept_id` and ordered by salary descending.
--  Query 2: Calculate cumulative company payroll ordered by `employee_id` ascending.
--  Query 3: Rank employees within each department (`dept_id`) from highest to lowest salary using `DENSE_RANK()` so tied salaries share the same rank without gaps.
--

-- SQL Concepts I use: Window Functions (OVER, PARTITION BY, ORDER BY)
SELECT first_name, last_name, dept_id, AVG(salary) OVER(PARTITION BY dept_id ORDER BY salary DESC) AS avg_salary
FROM employee_salary;

SELECT first_name, last_name, salary, SUM(salary) OVER(ORDER BY employee_id ASC) AS salary_accumulate
FROM employee_salary;

SELECT first_name, last_name, dept_id, salary, DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank 
FROM employee_salary;