-- CHALLENGE 1: Departmental Senior & Management Workforce Summary
-- Business Problem:
-- Executive Leadership wants a department-level overview of experienced staff and management
-- personnel to assess talent concentration, compensation levels, and age diversity across
-- core municipal departments.
--
-- Conditions:
--  Include employees aged 35 to 59 OR those holding a "manager" role.
--  Require a minimum salary of $50,000 and exclude any "assistant" titles.
--  Join employee demographics, salary, and department records to group by department name.
--  Calculate employee headcount, average salary, youngest age, and oldest age per department.
--  Keep only departments with at least 2 qualifying employees and an average salary of $60,000 or higher.
--  Sort by average salary descending, then youngest age ascending, and limit to the top 2 departments.
--

-- SQL Concepts I use: INNER JOIN (Multi-Table)
SELECT	dept.department_name AS dept_department_name, 
		COUNT(*) AS employee_count,
        AVG(salary) AS avg_salary,
        Min(age) AS youngest_age,
        Max(age) AS oldest_age
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS dept
	ON sal.dept_id = dept.department_id
WHERE (((dem.age >= 35 AND dem.age <= 59) OR sal.occupation LIKE '%manager%') 
		AND sal.salary >= 50000) AND sal.occupation NOT LIKE '%assistant%'
GROUP BY department_name
HAVING employee_count >= 2 AND avg_salary >= 60000
ORDER BY avg_salary DESC, youngest_age ASC
LIMIT 2
;

--
-- CHALLENGE 2: Cross-Departmental Retention & Executive Audit List
-- Business Problem:
-- Human Resources and Finance are compiling a combined audit roster of two priority employee
-- groups: seasoned operational staff in Parks & Recreation and Public Works, and high-earning
-- leadership or Finance personnel across the organization (including payroll records that may not
-- yet have a matching demographic profile). Retaining duplicate entries across both criteria helps
-- identify employees who qualify under multiple review tracks.
--
-- Conditions:
--  First cohort: Employees aged 40 or older earning at least $55,000 in "Parks and Recreation" or "Public Works", excluding "assistant" roles.
--  Second cohort: Employees earning at least $65,000 who are managers, directors, or work in "Finance", using a RIGHT OUTER JOIN on salary records so unmatched payroll entries are included.
--  Combine both result sets using UNION ALL to preserve overlapping appearances.
--  Sort the combined roster by salary descending, then employee ID ascending.
--

-- SQL Concepts I use: INNER JOIN, RIGHT OUTER JOIN, UNION ALL
SELECT dem.employee_id, dem.first_name, dem.last_name, dept.department_name, sal.salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS dept
	ON sal.dept_id = dept.department_id
WHERE dem.age >= 40 AND sal.salary >= 55000 
		AND (dept.department_name LIKE '%parks and recreation%' OR dept.department_name LIKE '%public works%')
		AND occupation NOT LIKE '%assistant%'
UNION ALL
SELECT sal.employee_id, sal.first_name, sal.last_name, dept.department_name, sal.salary
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS dept
	ON sal.dept_id = dept.department_id
WHERE sal.salary >= 65000 AND
	(sal.occupation LIKE '%manager%' OR sal.occupation LIKE '%director%' OR dept.department_name LIKE '%finance%')
ORDER BY salary DESC, employee_id
;