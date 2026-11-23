-- Lesson 10

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- WINDOWS FUNCTIONS
-- SAME AS GROUP BY BUT IT GIVE INDIVIDUAL ROW
SELECT dem.first_name, dem.last_name, dem.gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;

SELECT CONCAT(dem.first_name, ' ', dem.last_name) AS full_name, dem.gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT CONCAT(dem.first_name, ' ', dem.last_name) AS full_name, dem.gender, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, CONCAT(dem.first_name, ' ', dem.last_name) AS full_name, dem.gender, sal.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_nom,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, CONCAT(dem.first_name, ' ', dem.last_name) AS full_name, dem.gender, sal.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_nom,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;