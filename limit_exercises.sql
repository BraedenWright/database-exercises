SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC;

#2.  Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner ,Zucker, Zuberek, Zschoche, Zongker

SELECT DISTINCT *
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date
LIMIT 5;

#3.   Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, and Petter Stroustrup

SELECT DISTINCT *
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date
LIMIT 5 OFFSET 45;

#4.   The tenth page would consist of Pranay Narwekar, Marjo Farrow, Ennio Karcich, Dines Lubachevsky, and Ipke Fontan. 
#4.cont.  Limits determine the amount of data per page, OFFSET determines what page to start on, all part of pagination
