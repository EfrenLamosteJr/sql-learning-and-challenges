-- LESSON 8

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- CASE
SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'YOUNG'
    WHEN age BETWEEN 31 AND 50 THEN 'OLD'
    WHEN age > 50 THEN 'TOO OLD'
END AS age_bracket
FROM employee_demographics;

-- Pay Increase
-- < 50000 = 5%
-- > 50000 = 7%
-- BONUS
-- Finance = 10%

SELECT sal.employee_id, CONCAT(sal.first_name, ' ', sal.last_name), sal.occupation, sal.salary, dept.department_name,
CASE
	WHEN sal.salary < 50000 THEN salary + (salary * 0.05)
    WHEN sal.salary > 50000 THEN salary + (salary * 0.07)
END AS pay_increase,
CASE
	WHEN dept.department_name = 'finance' THEN salary + (salary * 0.10)
END AS bonus
FROM employee_salary AS sal
INNER JOIN parks_departments AS dept
	ON sal.dept_id = dept.department_id
;