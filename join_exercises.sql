#join_example_db first
USE join_example_db;

DESCRIBE roles;
SELECT * FROM roles;

SELECT * FROM users;


#join
SELECT DISTINCT *
FROM users
JOIN roles
ON users.role_id = role_id;

#left join
SELECT* 
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

#right join
SELECT* 
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

#aggregate functions with joining- roles and number of uses in each role
SELECT roles.name, count(*)
FROM roles
LEFT JOIN users
ON roles.id = users.role_id
GROUP BY roles.name;



#Exercises using Employee Database

#1-2.
USE employees;

SELECT concat(first_name, ' ', last_name) AS current_mngr, dept_name
FROM employees
JOIN dept_manager AS dm USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE dm.to_date > now()
ORDER BY dept_name;


#3.
SELECT CONCAT(first_name, ' ', last_name) AS current_mngr, dept_name, gender
FROM employees AS e
JOIN dept_manager AS dm USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE dm.to_date > NOW() AND gender = 'F'
ORDER BY dept_name;


#ladies currently managing dept

#4
SELECT title, COUNT(*)
FROM titles AS t
JOIN dept_emp de USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE t.to_date > NOW()
   AND de.to_date > now()
   AND dept_name LIKE 'Customer%'
GROUP BY title;



#5.
SELECT CONCAT(first_name, ' ', last_name) AS current_mngr, dept_name, salary
FROM salaries AS s
JOIN dept_manager AS dm USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN employees e USING(emp_no)
WHERE s.to_date > now()
   AND dm.to_date > now();
   
   
#6.
SELECT dept_no, dept_name, COUNT(emp_no)
FROM dept_emp de
JOIN departments AS d USING(dept_no)
WHERE de.to_date > NOW()
GROUP BY dept_name
ORDER BY dept_no;


#7
SELECT dept_name, AVG(salary)
FROM salaries s
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE s.to_date > now()
AND de.to_date > now()
GROUP BY dept_name
ORDER BY AVG(salary) DESC
LIMIT 1;


#8.  
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM salaries s
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
JOIN employees e USING(emp_no)
WHERE de.to_date > now()
AND s.to_date > now()
AND dept_name LIKE 'Market%'
ORDER BY salary DESC
LIMIT 1;


#9. 
SELECT CONCAT(first_name, ' ', last_name) AS current_mngr, salary, dept_name
FROM salaries s
JOIN dept_manager AS dm USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN employees e USING(emp_no)
WHERE dm.to_date > now()
AND s.to_date > now()
ORDER BY salary DESC
LIMIT 1;


#10.
SELECT dept_name, round(AVG(salary)) AS avg_salary
FROM salaries s
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
JOIN employees e USING(emp_no)
GROUP BY dept_name
ORDER BY AVG(salary) DESC;


#11. B-B-B-Bonus!!!
SELECT CONCAT(e.first_name, ' ', e.last_name) AS emp_name, dept_name, CONCAT(managers.first_name, ' ', managers.last_name) AS manager_name
FROM dept_emp de
JOIN employees e USING(emp_no)
JOIN departments d USING(dept_no)
JOIN dept_manager dm USING(dept_no)
JOIN employees AS managers ON managers.emp_no = dm.emp_no
WHERE de.to_date > now()
   AND dm.to_date > now()
ORDER BY emp_name;


#12.  Bonus on Bonus!!
SELECT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, salary
FROM departments d
JOIN dept_emp de USING(dept_no)
JOIN employees e USING(emp_no)
JOIN salaries s USING(emp_no)
WHERE de.to_date > now()
AND s.to_date > now()
AND (d.dept_name, salary) IN
  (SELECT d.dept_name, max(salary)
    FROM salaries s
    JOIN employees e USING(emp_no)
    JOIN dept_emp de USING(emp_no)
    JOIN departments d USING(dept_no)
    WHERE de.to_date > now()
    AND s.to_date > now()
    GROUP BY dept_name
    );
    
    