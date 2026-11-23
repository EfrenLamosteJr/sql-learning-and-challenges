-- LESSON 11

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- CTS
-- SAME AS SUBQUERY BUT IT LOOKS CLEARNER
WITH CTE_Example AS
(
SELECT gender, AVG(age) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT gender, AVG(avg_sal)
FROM CTE_Example
GROUP BY gender
;

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(
SELECT gender, AVG(age) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
GROUP BY gender
;

WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics AS dem
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example AS CTE
JOIN CTE_Example2 AS CTE2
	ON CTE.employee_id = CTE2.employee_id
;
