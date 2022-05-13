#Walkthrough - Write a query to find all rental's rental_date, return_date, amount paid for the
#rental, and the title of each rental.
SELECT rental_date, return_date, amount, title FROM sakila.rental
JOIN sakila.payment USING (rental_id)
JOIN sakila.inventory USING (inventory_id)
JOIN sakila.film USING (film_id)
