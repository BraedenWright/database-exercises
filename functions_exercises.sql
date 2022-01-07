-- copy of ORDER BY text

SELECT *  
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
#2.  Irena Reutenauer/ Vidya Simmen

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
#3. Irena Acton/ Vidya Zweizig

SELECT last_name, first_name 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
#4.   Acton, Irena/ Zyda, Maya

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%e'
ORDER BY emp_no;
#5.  899 employees, 10021 Ramzi Erde/ 499648 Tadahiro Erde

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%e'
ORDER BY hire_date DESC;
#6.   899 employees, Teiji Eldridge/ Sergi Erde

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;
#7.   362 employees, Khun Bernini, Douadi Pettis

-- start of functions exercises

SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%e';


SELECT Upper(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%e';


SELECT datediff(hire_date, curdate()) AS days_with_company
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date LIKE '199%'
ORDER BY days_with_company;

SELECT min(salary) FROM salaries;

# min salary is $38,623

SELECT max(salary) FROM salaries;

# max salary is $158,220


SELECT Lower(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2),SUBSTR(birth_date, 3, 2))) AS emp_username
FROM employees;