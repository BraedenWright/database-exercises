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
