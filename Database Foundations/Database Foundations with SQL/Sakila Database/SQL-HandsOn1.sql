#PART ONE
#Query all columns for actors with the first name of "Cuba".
SELECT * FROM sakila.actor WHERE first_name = "Cuba"
#Query the film title and film id that has an film_id greater than 5 and less than 20.
SELECT title, film_id FROM sakila.film WHERE film_id > 5 and film_id < 20
#Query the first and last name, and email of customers who have the last name "Rodriguez" or their last name begins with a "Mc".
SELECT first_name, last_name, email FROM sakila.customer WHERE last_name = "Rodriguez" OR last_name LIKE "Mc%"
#Query all columns of the films with a title that begins with "a".
SELECT title FROM sakila.film WHERE title LIKE 'A%'
#Query all titles of films that are not in the language of English or Japanese.
SELECT title from sakila.film WHERE language_id NOT IN (SELECT language_id from sakila.language WHERE name = "English" OR name = "Japanese")

#PART TWO
#You were just hired at a company as a data analyst, and your company needs more information form teh database.
#They would like to see all payments that had a rental amount is over 0.99 cents.
#However, they only want to see the rental id and payment date that is attached to that payment.
#Once you have finished that, they would like to see the staff id and customer id from the payments that have an amount over 0.99 cents.
#* I will need to complete two queries.
#Query 1:
SELECT rental_id, payment_date date FROM payment WHERE amount > .99
#Query 2:
SELECT staff_id, customer_id FROM payment WHERE amount > .99