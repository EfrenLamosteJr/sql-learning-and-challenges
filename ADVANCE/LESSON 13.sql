-- LESSON 13

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- SAME TO FUNCTION IN PROGRAMMING YOU CAN CALL QUERY AND USE IT
-- YOU CAN SAVE QUERY AND CALL IT AND ITS SAVED ON STORE PROCEDURES
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

-- DELIMITER CHANGING DELIMITER OR END MARK
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;


CALL large_salaries3();

DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_out INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE employee_id = employee_id_out;
END $$
DELIMITER ;

CALL large_salaries3(1)


