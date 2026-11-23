-- LESSON 6

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;


-- UNIONS
SELECT age, gender
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;
;

-- DISTINCT = UNIQUE VALUES NO DUPLICATES
SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;
;

-- ALL = INCLUDE DUPLICATES
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;
;

-- USE CASE
SELECT first_name, last_name, 'old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'Highly Paid Emp' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;
