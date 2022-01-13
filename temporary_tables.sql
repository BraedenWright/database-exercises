
#1.
/* SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE to_date > curdate(); */

CREATE TEMPORARY TABLE employees_with_departments AS 
	(
    SELECT first_name, last_name, dept_name
    FROM employees.employees
    JOIN employees.dept_emp USING(emp_no)
    JOIN employees.departments USING(dept_no)
    WHERE to_date > curdate()
	);
	
#. 1.a.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);


#. 1.b.
UPDATE employees_with_departments SET full_name = concat(first_name, ' ', last_name);


#. 1.c.
ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

#. test it out
SELECT * FROM employees_with_departments;

#. 1.d.  I suppose I couldve just put the full name into my original query



#. 2.
CREATE TEMPORARY TABLE payments AS 
	(SELECT payment_id, customer_id, staff_id, rental_id, amount * 100 AS amount_in_pennies, payment_date, last_update
    FROM sakila.payment
	);
	
SELECT * FROM payments;

DESCRIBE payments;

ALTER TABLE payments MODIFY amount_in_pennies INT NOT NULL;


#. 3.

SELECT AVG(salary), std(salary) FROM employees.salaries;

CREATE TEMPORARY TABLE historic_aggregates AS 
	(SELECT AVG(salary) AS avg_salary, std(salary) AS std_salary
    FROM employees.salaries 
	);
	
#  So I can check on my status
SELECT * FROM historic_aggregates;


/* SELECT dept_name, AVG(salary) AS department_current_average
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE employees.dept_emp.to_date > now()
AND employees.salaries.to_date > now()
GROUP BY dept_name;  */

CREATE TEMPORARY TABLE current_info AS 
	(
    SELECT dept_name, AVG(salary) AS department_current_average
    FROM employees.salaries
    JOIN employees.dept_emp USING(emp_no)
    JOIN employees.departments USING(dept_no)
    WHERE employees.dept_emp.to_date > now()
    AND employees.salaries.to_date > now()
    GROUP BY dept_name
	);
	
	
#checkpoint!
SELECT * FROM current_info;

ALTER TABLE current_info ADD historic_avg FLOAT(10,2);

ALTER TABLE current_info ADD historic_std FLOAT(10,2);

ALTER TABLE current_info ADD zscore FLOAT(10,2);

UPDATE current_info SET historic_avg = (SELECT avg_salary FROM historic_aggregates); 

UPDATE current_info SET historic_std = (SELECT std_salary FROM historic_aggregates); 

UPDATE current_info 
SET zscore = (department_current_average - historic_avg) / historic_std; 

# test is successful.  Look like Sales is the best dept to work for, while Human Resources is the worst. Yikes
# now lets just clean up the table

SELECT department_current_average
FROM current_info
