-- LESSON 3 WHERE AND HAVING
-- WHERE AND HAVING
-- HAVING IT WORKS LIKE WHERE BUT COMES AFTER GROUP. IT FILTER THE GROUPS OR AGGREGATIONS
-- WHERE FILTER THE ROW

SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
HAVING gender = "Male";

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE "%manager%" -- WE FILTER THE OCCUPATION THAT HAVE managers AND GROUP THEM
GROUP BY occupation;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE "%manager%" -- WE FILTER THE OCCUPATION THAT HAVE managers AND GROUP THEM AND ADD ANOTHER CONDITION TO SHOW AVG SALARY HIGHER THAN 75K
GROUP BY occupation
HAVING AVG(salary) >75000;