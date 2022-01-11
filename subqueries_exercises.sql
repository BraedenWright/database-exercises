#1.
SELECT *
FROM employees
JOIN dept_emp USING(emp_no)
WHERE to_date > now()
AND hire_date =
	(SELECT hire_date
	FROM employees
	WHERE emp_no = 101010);
	
	
#2.
SELECT DISTINCT title
FROM titles
WHERE emp_no IN 
   (SELECT emp_no
   FROM employees
   JOIN dept_emp USING(emp_no)
   WHERE first_name = 'aamod'
   AND to_date > now());


#3.
SELECT count(*)
FROM employees 
WHERE emp_no NOT IN 
	(SELECT *
	FROM dept_emp
	WHERE to_date > now());