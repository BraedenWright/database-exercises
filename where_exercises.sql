USE `employees`;

SELECT DISTINCT *
FROM `employees`
WHERE `first_name` IN ('Irena', 'Vidya', 'Maya');
#2.  709 records pulled

SELECT DISTINCT first_name, last_name
FROM `employees`
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya';
#3.   656  records returned.  Not the same as using IN

SELECT *
FROM employees
WHERE gender = 'M'
AND (first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya');
#4.   441 records returned

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%';
#5.   7330 employees with last names starting with E

SELECT DISTINCT *
FROM employees
WHERE last_name NOT LIKE 'E%'
  AND last_name LIKE '%e';
#6.   30,723 employees start or end with E.  22,494 end in E but dont start with E

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%e'
AND last_name LIKE 'E%';
#7.     23,393 employees start and end with E.  

SELECT DISTINCT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
#8.    135,214 employees hired in the 90's

SELECT first_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25';
#9.    842 Christmas birthdays

SELECT first_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';
#10.   362 employees hired in 90's with Christmas birthday

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%q%';
#11.    1873 employees with a Q in their last name

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
#12.    547 employees with Q but not QU in their last name