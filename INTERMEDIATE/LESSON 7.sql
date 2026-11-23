-- LESSON 7

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- STRING FUNCTION
-- LENGHT, UPPER, LOWER
SELECT first_name, LENGTH(first_name) AS length, UPPER(first_name) AS capital, LOWER(first_name) AS lower
FROM employee_demographics
ORDER BY 2;

-- TRIM
SELECT TRIM('          sky		');
SELECT LTRIM('         sky		');
SELECT RTRIM('         sky		');

-- LEFT/RIGHT = Get the number of string depends on parameter
-- SUBSTRING
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3,2),
SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;

-- REPLACE
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

SELECT first_name, LOCATE('a', first_name)
FROM employee_demographics;

-- CONCAT
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;

