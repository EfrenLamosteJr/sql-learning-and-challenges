-- LESSON 9

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- SUBQUERIES
SELECT *
FROM employee_salary
WHERE employee_id IN 
					( SELECT employee_id
						FROM employee_salary
                        WHERE dept_id = 1)
;

SELECT first_name, salary,
	(SELECT AVG(salary)
    FROM employee_salary)
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age)
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(max_age)
FROM 
(SELECT gender, 
AVG(age), 
MAX(age) AS max_age, 	
MIN(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender
;