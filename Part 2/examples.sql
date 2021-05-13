-- View example
DROP VIEW IF EXISTS emp_proj_combo;

CREATE VIEW emp_proj_combo
AS SELECT p.pnumber, p.pname, d.dnumber, d.dname, COUNT(*) as employee_count, SUM(e.salary) as total_salary, SUM(w.hours) as total_hours
	FROM project p, employee e, department d, works_on w
	WHERE e.ssn = w.essn and p.pnumber = w.pno and d.dnumber = e.dno
	GROUP BY p.pname;



-- Trigger Example
DELIMITER $$
CREATE TRIGGER deps_def_loc
AFTER INSERT ON department
FOR EACH ROW
BEGIN
	INSERT INTO dept_locations
    VALUES(NEW.dnumber, 'Houston');
END$$
DELIMITER ;
