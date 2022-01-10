#join_example_db first
USE join_example_db;

SELECT * FROM roles;

SELECT * FROM users;


#join
SELECT *
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
USE employees;

SELECT concat(first_name, ' ', last_name) AS full_name, dept_name
FROM employees
JOIN dept_manager AS dm USING(emp_no)
JOIN departments AS d USING(dept_no)
WHERE dm.to_date > now()
ORDER BY dept_name;


