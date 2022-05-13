-- Write a query to find the first and last name, customer ID and rental ID for customers who
-- have rented a film.
SELECT first_name, last_name, rental_id, customer_id FROM sakila.customer
INNER JOIN sakila.rental USING (customer_id)
-- Write a query that finds all films with actors that have an actor_id 5.
SELECT title, actor_id, first_name, last_name FROM sakila.film
JOIN sakila.film_actor USING (film_id)
JOIN sakila.actor USING (actor_id)
WHERE actor_id = 5
-- Write a query that lists out all information of every film along with the name of the
-- language for each film, even if a language does not exist for that film.
SELECT * FROM sakila.language
LEFT OUTER JOIN sakila.film USING (language_id)
-- Write a query that lists out the title of films and the name of the actors who starred
-- in those films. Additionally, only list films that starred artists whose first names
-- start with a vowel.
SELECT title, first_name, last_name FROM sakila.film 
LEFT OUTER JOIN sakila.film_actor USING (film_id)
JOIN sakila.actor USING (actor_id)
WHERE first_name LIKE 'A%'

-- PART 2: You have just been hired as a Data Analyst for a company that rents films to
-- customers. They would like an inventory list of films that were rented for more than 
-- $4.99.
SELECT title, amount, inventory_id, rental_id FROM sakila.film
JOIN sakila.inventory USING (film_id)
JOIN sakila.rental USING (inventory_id)
JOIN sakila.payment USING (rental_id)
WHERE amount = 4.99
