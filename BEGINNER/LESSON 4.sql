-- LESSON 4
-- LIMIT

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

-- LIMIT START, COUNT 
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3, 5;