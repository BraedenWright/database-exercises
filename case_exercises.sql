
#1. 
USE employees;


SELECT emp_no, dept_no, de.from_date,
	de.to_date,
	IF(to_date > now(), 1, 0) AS is_current_employee
FROM employees
JOIN dept_emp de USING(emp_no);


#2. 
