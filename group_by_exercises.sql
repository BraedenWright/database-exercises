USE employees;

SELECT DISTINCT title
FROM titles;

#There are 7 unique titles


SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;


SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY full_name;

#846 unique names


SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

# Chleq, Lindqvist, Qiwen


SELECT last_name, count(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

# Chleq (189), Lindqvist (190), Qiwen (168)


SELECT gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

# M (441), F (268)


SELECT DISTINCT Lower(
                     CONCAT(SUBSTR(first_name, 1, 1),
                            SUBSTR(last_name, 1, 4), 
                            '_', 
                            SUBSTR(birth_date, 6, 2),
                            SUBSTR(birth_date, 3, 2))
                            ) AS username
FROM employees
GROUP BY username
ORDER BY username;


# more aggregate function practice
#avg salary
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;



#count of number of employees in each dept
SELECT dept_no, COUNT(emp_no)
FROM dept_emp
GROUP BY dept_no;



#How many salaries for each employee
SELECT emp_no, COUNT(salary)
FROM salaries 
GROUP BY emp_no;



#Min and Max of each employees
SELECT emp_no, MAX(salary), MIN(salary)
FROM salaries
GROUP BY emp_no;



#standard deviation
SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no;



#max salary over $150,000
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no, salary
HAVING salary > 150000;



#avg salary between $80k - $90k
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no, salary
HAVING salary > 80000 AND salary < 90000;