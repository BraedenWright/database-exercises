
#1. 
USE employees;


SELECT emp_no, dept_no, de.from_date,
	de.to_date,
	IF(to_date > now(), 1, 0) AS is_current_employee
FROM employees
JOIN dept_emp de USING(emp_no)
ORDER BY emp_no;


#2. 
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name,
	CASE 
		WHEN LEFT(last_name, 1) IN ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN ('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees
ORDER BY full_name;

#3.
SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN '50s'
		WHEN birth_date LIKE '196%' THEN '60s'
	END AS Decade,
	COUNT(*) AS number_of_births_in_decade
FROM employees
GROUP BY Decade;


#4.
SELECT 
	CASE 
		WHEN dept_no IN ('d008', 'd005') THEN 'R&D'
		WHEN dept_no IN ('d007', 'd001') THEN 'Salaes & Marketing'
		WHEN dept_no IN ('d004', 'd006') THEN 'Prod & QM'
		WHEN dept_no IN ('d002', 'd003') THEN 'Finance & HR'
		ELSE 'Customer Service'
	END AS Dept_Group, round(AVG(s.salary)) AS avg_salary
FROM departments
JOIN dept_emp de USING(dept_no)
JOIN salaries s USING(emp_no)
WHERE s.to_date > now()
GROUP BY Dept_Group;
