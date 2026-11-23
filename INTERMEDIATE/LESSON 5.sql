-- LESSON 5
-- JOINS
 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOINS
-- RETURN BOTH SAME COLUMN/ROW FROM DIFFERENT TABLE
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOIN
-- LEFT OUTER = RETURN EVERYTHING FROM LEFT TABLE EVEN NO MATCH
-- RIGHT OUTER = RETURN EVERYTHING FROM LEFT TABLE EVEN NO MATCH
SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;
SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- SELF JOIN
-- TIE THE TABLE ON HIMSELF
SELECT emp1.employee_id AS emp_santa,
	emp1.first_name AS first_name_santa,
    emp1.last_name AS first_last_santa,
    emp2.employee_id AS emp_santa_emp,
	emp2.first_name AS first_name_emp,
    emp2.last_name AS first_last_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- JOINING MULTIPLE TABLES TOGETHER
SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id	= pd.department_id
;

