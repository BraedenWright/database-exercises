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
   AND to_date > now()
    );


#3.
SELECT *
FROM employees
WHERE emp_no NOT IN
	(
	SELECT emp_no
	FROM salaries
	WHERE to_date > now()
	);
#59,900 employees
	
	
	
#4.  
SELECT *
FROM employees
WHERE emp_no IN 
	(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > now()
	)
AND gender = 'F';


#5. 
SELECT *
FROM employees
WHERE emp_no IN 
	(SELECT emp_no
	FROM salaries s
	WHERE to_date > now()
	AND salary > 
		(SELECT AVG(salary)
		FROM salaries
		)
	);
	
	
#6. 

# max current salary?
SELECT max(salary) FROM salaries WHERE to_date > now();

# 1 std for current salary?
SELECT std(salary) FROM salaries WHERE to_date > now();

SELECT count(*) AS 'current salaries within 1 std dev of current highest salary'
FROM salaries
WHERE to_date > now()
AND salary > (
(SELECT max(salary) 
FROM salaries 
WHERE to_date > now()) - 
(SELECT std(salary) FROM salaries WHERE to_date > now())
);

# 83 current salaries within 1 std dev of current highest salary

SELECT(
	(SELECT count(*)
	 FROM salaries
	 WHERE to_date > now()
	 AND salary > (
		(SELECT max(salary) 
		FROM salaries 
		WHERE to_date > now()
		) - 
			(SELECT std(salary) 
			FROM salaries 
			WHERE to_date > now()
			)
	 				)	
	)/(SELECT count(*)
FROM salaries 
WHERE to_date > now())) * 100 AS 'percentage within 1 Stdev of Max';

# 0.0346 within 1 Stdev of Max


#B-B-B-BONUS!!!
# 1. 
SELECT * 
FROM dept_manager
JOIN departments d USING(dept_no)
JOIN employees e USING(emp_no)
WHERE emp_no IN 
	(SELECT emp_no
	FROM employees
	WHERE gender = 'F'
	)
AND to_date > now();


# 2. 
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE emp_no IN 
	(SELECT emp_no
	FROM salaries
	WHERE salary IN
		(SELECT max(salary)
		FROM salaries
		)
	);

#Tokuyasu Pesch


#3.
SELECT CONCAT(first_name, ' ', last_name) AS full_name, d.dept_name
FROM employees
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE emp_no IN 
	(SELECT emp_no
	FROM salaries
	WHERE salary IN
		(SELECT max(salary)
		FROM salaries
		)
	);
	
# Tokuyasu Pesch works for the Sales dept