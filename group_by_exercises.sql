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


SELECT DISTINCT Lower(CONCAT(SUBSTR(first_name, 1, 1),
       SUBSTR(last_name, 1, 4), 
          '_', 
            SUBSTR(birth_date, 6, 2),
             SUBSTR(birth_date, 3, 2))) 
          AS emp_username
FROM employees
GROUP BY emp_username;
