-- LESSONS 1
-- SELECT 

SELECT *
FROM parks_and_recreation.employee_demographics;

-- ALIAS 
SELECT upper(first_name) AS Firstname,
lower(last_name) AS LastName,
age
FROM parks_and_recreation.employee_demographics;

-- DISTINCT = UNIQUE VALUES
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

-- WHERE
SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_demographics
WHERE gender != 'Female';

-- AND or NOT -- LOGICAL OPERATORS
SELECT *
FROM employee_salary
WHERE salary >= 50000 AND salary <= 70000;

SELECT *
FROM employee_demographics
WHERE (age > 40 OR NOT gender = "Female") AND birth_date > "1980-01-01";

-- LIKE
-- % = anything before or after
-- _ = number of character before or after
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM employee_demographics
WHERE birth_date LIKE "1985%";







