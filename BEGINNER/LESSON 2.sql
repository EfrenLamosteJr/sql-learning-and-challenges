-- LESSON 2
-- GROUP
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- AGGREGATION 
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name ASC; 

SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;

-- COLUMN NUMBER NOT RECOMMENDED
SELECT *
FROM employee_demographics
ORDER BY 5, 4 DESC; 
