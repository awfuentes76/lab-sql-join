-- Lab | SQL Join
-- In this lab, you will be using the Sakila database of movie rentals.The database is structured as follows:
-- 1. List the number of films per category.
USE sakila;
SELECT c.name AS category, COUNT(f.film_id) AS num_films
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT first_name, last_name, address_id 
FROM staff;

-- OTRA FORMA:
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a 
ON s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p 
ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- 4. List all films and the number of actors who are listed for each film.
SELECT F.film_id, F.title, COUNT(FA.actor_id) AS actores_por_peli
FROM film F
JOIN film_actor FA
ON F.film_id=FA.film_id
GROUP BY F.film_id;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.
SELECT C.customer_id, C.first_name, C.last_name, SUM(P.amount) as total
FROM customer C
JOIN payment P 
ON C.customer_id=P.customer_id
GROUP BY C.customer_id
;
