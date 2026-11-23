-- CTES
-- CHALLENGE 1: Departmental Salary Benchmarking Against Company Average
-- Business Problem:
-- Executive Leadership wants to compare each department's average, highest, and lowest salary
-- against the overall average across all departments to spot which teams lead or lag behind
-- organization-wide compensation benchmarks.
--
-- Conditions:
--  Calculate each department's average, highest, and lowest salary by joining salary and department records.
--  Compute the overall average across all departmental averages in a second CTE.
--  Combine both CTEs to display each department's metrics alongside the company-wide departmental average and the dollar variance.
--  Sort the final output from highest to lowest departmental average salary.
--

-- SQL Concepts I use: CTEs
WITH salary_group AS
(
SELECT dept_id, department_name, AVG(salary) avg_salary, MAX(salary) highest_salary, MIN(salary) lowest_salary
FROM employee_salary AS sal
JOIN parks_departments AS dept
	ON sal.dept_id = dept.department_id
GROUP BY dept_id
),
dept_all_sal_avg AS
(
SELECT AVG(avg_salary) AS company_department_average
FROM salary_group
)
SELECT dept_id, department_name, avg_salary, highest_salary, lowest_salary, company_department_average,
avg_salary - company_department_average AS salary_difference

FROM salary_group AS sg
CROSS JOIN dept_all_sal_avg AS ds

ORDER BY avg_salary DESC
;

-- CHALLENGE 2: Senior Mid-Career Compensation Benchmark
-- Business Problem:
-- Human Resources is reviewing compensation for experienced employees aged 40 and older who
-- earn at least $50,000, comparing each individual's salary directly against the group's
-- overall average to assess internal pay alignment.
--
-- Conditions:
--  Filter for employees aged 40 or older earning at least $50,000 by joining demographics and salary records.
--  Calculate the average salary of that qualifying cohort in a second CTE.
--  Display every qualifying employee alongside the cohort average, sorted from highest to lowest salary.
--

-- SQL Concepts I use: CTEs
WITH emp_age_sal_qua AS
(
SELECT sal.employee_id,	dem.age, sal.first_name, sal.last_name, sal.salary AS qua_salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
WHERE age >= 40 AND salary >= 50000
),
avg_salary_qeury AS
(
	SELECT AVG(qua_salary) AS avg_salary
    FROM emp_age_sal_qua
)
SELECT *
FROM emp_age_sal_qua AS asqua
CROSS JOIN avg_salary_qeury AS avg_sal_que
ORDER BY qua_salary DESC;

-- TEMP TABLE
-- CHALLENGE 3: Above-Average Tier-1 Earner Identification
-- Business Problem:
-- Payroll analysts want to isolate employees earning at least $50,000 and then narrow that
-- pool down to individuals earning strictly above the average salary within that $50K+ tier
-- for annual merit review.
--
-- Conditions:
--  Store all employees earning $50,000 or more in a temporary table.
--  Store the average salary of that filtered group in a second temporary table.
--  Query the first temporary table to return employees earning above the stored tier average, sorted descending.
--

-- SQL Concepts I use: Temporary Tables
CREATE TEMPORARY TABLE salary_higher_equal_50k
(
SELECT employee_id, first_name, last_name, salary
FROM employee_salary
WHERE salary >= 50000
);

CREATE TEMPORARY TABLE salary_avg_in_50k
(
SELECT AVG(salary) AS avg_salary
FROM salary_higher_equal_50k
);

SELECT employee_id, first_name, last_name, salary
FROM salary_higher_equal_50K
WHERE salary > (SELECT avg_salary
FROM salary_avg_in_50k)
ORDER BY salary DESC
;

-- CHALLENGE 4: High-Payroll Department Spend Audit
-- Business Problem:
-- Finance is auditing total departmental payroll expenditure among staff earning over $40,000
-- to identify departments whose core payroll spend exceeds $100,000.
--
-- Conditions:
--  Save employee IDs, salaries, and department IDs for employees earning over $40,000 into a temporary table.
--  Join the temporary table with department names and aggregate total salary per department.
--  Filter for departments with total qualifying payroll exceeding $100,000, ordered highest to lowest.
--

-- SQL Concepts I use: Temporary Tables
CREATE TEMPORARY TABLE salary_avg_in_40K
(
    SELECT employee_id, salary, dept_id
    FROM employee_salary
    WHERE salary > 40000
);

SELECT *
FROM salary_avg_in_40K;
	
SELECT sal40k.dept_id, pd.department_name, SUM(salary) total_salary
FROM salary_avg_in_40K AS sal40k
JOIN parks_departments AS pd
	ON sal40k.dept_id = pd.department_id
GROUP BY sal40k.dept_id
HAVING SUM(salary) > 100000
ORDER BY SUM(salary) DESC
;


-- STORE PROCEDURE
-- CHALLENGE 5: Reusable Salary Threshold Audit Procedure
-- Business Problem:
-- HR frequently pulls ad-hoc lists of employees earning above varying salary thresholds during
-- budget planning. Creating a parameterized stored procedure eliminates repetitive query writing
-- and standardizes salary tier lookups.
--
-- Conditions:
--  Create a stored procedure accepting a minimum salary input parameter.
--  Return matching employees sorted from highest to lowest salary.
--  Test the procedure using $50,000 and $70,000 thresholds.

-- SQL Concepts I use: Stored Procedures
DELIMITER $$
CREATE PROCEDURE salary_audit(salary_input INT)
BEGIN
	SELECT employee_id, first_name, last_name, occupation, salary
    FROM employee_salary
    WHERE salary >= salary_input
    ORDER BY salary DESC;
END $$
DELIMITER ;

CALL salary_audit(50000);
CALL salary_audit(70000);


-- CHALLENGE 6: Departmental Compensation & Benchmark Report Procedure
-- Business Problem:
-- Department heads need an on-demand compensation report for their specific department that
-- displays each team member's pay alongside the department's overall average salary for quick
-- internal comparison.
--
-- Conditions:
--  Create a stored procedure accepting a department ID input parameter.
--  Display each employee in that department alongside the department-wide average salary, ordered highest to lowest.
--  Execute the procedure for departments 1 and 6.
--
-- SQL Concepts I use: Stored Procedures
DELIMITER $$
CREATE PROCEDURE dept_sal_report(dept_id_input INT)
BEGIN
	SELECT employee_id, first_name, last_name, occupation, salary, dept_id, AVG(salary) OVER(PARTITION BY dept_id) AS dept_avg_sal
	FROM employee_salary
    WHERE dept_id = dept_id_input
    ORDER BY salary DESC;
END $$
DELIMITER ;

CALL dept_sal_report(1);
CALL dept_sal_report(6);

-- TRIGGER
-- CHALLENGE 7: Automated New-Hire Payroll Audit Log
-- Business Problem:
-- Internal Audit requires an automatic, tamper-evident log whenever a new employee record is
-- inserted into the payroll table so new salary entries can be tracked with timestamps. --
-- Conditions:
--  Create an audit table storing employee ID, occupation, salary, and an automatic timestamp.
--  Build an AFTER INSERT trigger on `employee_salary` that automatically logs every new row into the audit table.
--  Verify the trigger with a test insert and clean up the temporary audit objects afterward.
--

-- SQL Concepts I use: Trigger
CREATE TABLE employee_salary_audit
(
	audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    occupation VARCHAR(100),
    salary DECIMAL(10, 2),
    audit_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER insert_audit_employee
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_salary_audit (employee_id, occupation, salary)
    VALUES (NEW.employee_id, NEW.occupation, NEW.salary);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (22, 'Mang', 'Kanor,', 'Guard', 10.10, NULL);

SELECT *
FROM employee_salary_audit;

DROP TABLE employee_salary_audit;
DROP TRIGGER insert_audit_employee;

-- CHALLENGE 8: Daily Retirement Eligibility Monitoring Event
-- Business Problem:
-- Human Resources wants an automated daily check that flags employees over age 60 into a
-- retirement review queue without duplicating employees who have already been logged.
--
-- Conditions:
--  Create a `retirement_review` table to store eligible employee details.
--  Schedule a recurring daily MySQL Event that inserts employees older than 60 who do not already exist in the review table.
--

-- SQL Concepts I use: Events
SELECT *
FROM retirement_review;

CREATE TABLE retirement_review
(
    employee_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT
);

DELIMITER $$
CREATE EVENT retirement_review_trigger
	ON SCHEDULE EVERY 1 DAY
DO
BEGIN
INSERT INTO retirement_review (employee_id, first_name, last_name, age)
    SELECT dem.employee_id, dem.first_name, dem.last_name, dem.age
    FROM employee_demographics AS dem
    WHERE dem.age > 60
		  AND NOT EXISTS
		  (
			  SELECT 1
			  FROM retirement_review AS rr
			  WHERE rr.employee_id = dem.employee_id
		  );
END $$
DELIMITER ;

-- CHALLENGE 9: Weekly High-Earner Retention Watchlist Event
-- Business Problem:
-- Executive Leadership wants a weekly automated watchlist capturing high-earning key personnel
-- ($65,000+ in non-assistant roles) so HR can proactively monitor retention risks without
-- inserting duplicate records.
--
-- Conditions:
--  Create a `retention_watchlist` table with `employee_id` as the primary key.
--  Schedule a weekly MySQL Event that appends qualifying employees earning at least $65,000 (excluding assistants) who are not yet on the watchlist.
--  Verify that the MySQL Event Scheduler status is active.
--

-- SQL Concepts I use: Events
SELECT *
FROM retention_watchlist;

CREATE TABLE retention_watchlist
(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    occupation VARCHAR(100),
    salary decimal (10,2)
);

DELIMITER $$
CREATE EVENT retention_watchlist_event
	ON SCHEDULE EVERY 1 WEEK
DO
BEGIN
	INSERT INTO retention_watchlist (employee_id, first_name, last_name, occupation, salary)
    SELECT employee_id, first_name, last_name, occupation, salary
    FROM employee_salary AS sal
    WHERE (salary >= 65000 AND occupation NOT LIKE '%Assistant%')
    AND NOT EXISTS(
    SELECT 1
    FROM retention_watchlist AS rw
    WHERE rw.employee_id = sal.employee_id
    );
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';