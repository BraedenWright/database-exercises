-- 1.

SELECT *
FROM actor;

SELECT last_name
FROM actor;

SELECT film_id, title, release_year
FROM film;

-- 2. 

SELECT DISTINCT last_name
FROM actor;

SELECT DISTINCT postal_code
FROM address;

SELECT DISTINCT rating
FROM film;

-- 3.
	-- a.
DESCRIBE film;

SELECT title, description, rating, length
FROM film
WHERE length > '180';

	-- b.
DESCRIBE payment;

SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date >= '2005-05-27';

	-- c.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date LIKE '2005-05-27%';

	-- d.
SELECT *
FROM customer
WHERE last_name LIKE 's%n';

	-- e.
SELECT *
FROM customer
WHERE active = 0
AND last_name LIKE 'm%';

	-- f.
DESCRIBE category;

SELECT *R
FROM category
WHERE category_id > '4'
AND `name` LIKE 'c%' 
OR `name` LIKE 's%'
OR `NAME` LIKE 't%';

	-- g.
DESCRIBE staff;

SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE `password` != 'null';

	-- h.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE `password` IS NULL;


-- 4.
	-- a.




-- 16.
DESCRIBE film;
DESCRIBE film_category;
DESCRIBE inventory;

SELECT f.film_id, f.title, c.name
FROM film f
JOIN film_category fc USING(film_id) 
JOIN category c USING(category_id)
WHERE `name` = 'family';

-- 17. 
SELECT store_id, sum(amount)
FROM payment
JOIN rental USING(rental_id)
JOIN inventory USING(inventory_id)
JOIN store USING(store_id)
GROUP BY store_id;

-- 18.
SELECT store_id, city, country
FROM store
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country USING(country_id);

-- 19.
