-- LESSON 12

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- TEMP TABLE
-- ITS WORK IN DIFFERENT WINDOWS BUT IF YOU QUIT THE SOFTWARE IT WILL DISAPEAR OR RESET
CREATE TEMPORARY TABLE temp_tabless
(
dept_id varchar(10),
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

INSERT INTO temp_tabless
VALUES('20', 'Efren', 'Lamoste', 'Bantatay');

SELECT *
FROM temp_tabless;

CREATE TEMPORARY TABLE salary_over__50kkkk
(
SELECT dept_id, salary
FROM employee_salary
WHERE salary >= 50000
);

CREATE TEMPORARY TABLE salary_below__40kkkk
(
SELECT dept_id, salary
FROM employee_salary
WHERE salary <= 40000
);

SELECT *
FROM salary_over__50kkkk AS sal50k
JOIN temp_tabless AS temp
 ON sal50k.dept_id = temp.dept_id;