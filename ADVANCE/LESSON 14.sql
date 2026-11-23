-- LESSON 14

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- TRIGGER = IT EXECUTE A QUERY WHEN THE CONDITION HAPPENS
DELIMITER $$
CREATE TRIGGER employee_insertt
		AFTER INSERT ON employee_salary
        FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jose', 'Riz', 'Writer', '10', NULL);

-- EVENTS = IT EXECUTE IN SCHEDULE
DELIMITER $$
CREATE EVENT deleteS_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE 
	FROM employee_demographics
    WHERE age > 60;
END $$
DELIMITER ;

-- FIX POSSIBLE PROBLEM
SHOW VARIABLES LIKE 'event%';
-- edit/preference/sql_editor/(uncheck)


