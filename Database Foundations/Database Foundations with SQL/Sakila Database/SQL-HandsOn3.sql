-- Write a query that Inserts a new actor into the database. Once you ahve completed the insert, write
-- a query to view all information for that specific actor.
insert into sakila.actor (first_name, last_name)
values ("Emma", "Stone") 

SELECT * FROM sakila.actor
where last_name = "Stone"

-- Write a query to Update the actor that you just inserted. Give your new actor a first_name
-- of Emmy and a last_name of Rock. When you have completed that update, run another query
-- to see your updated employee.
UPDATE sakila.actor
set first_name = "Emmy" and last_name = "Rock"
where actor_id = 203

SELECT * from sakila.actor
where last_name = "Rock"


-- Write a query that finds all staff that do not have a value specified for password.
select * FROM sakila.staff
where password is null

-- Write a query that finds all staff's information that has a value for first_name and 
-- store_id.
SELECT * FROM sakila.staff
where first_name IS NOT NULL and store_id IS NOT NULL

-- Write a query that updates all people with a Null value in the address2 column. If the
-- district is Alberta, put address2 as Canada, and if the district is QLD, put Australia.
UPDATE sakila.address
SET address2 = "Canada"
WHERE district = "Alberta"

UPDATE sakila.address,
SET address2 = "Australia"
WHERE district = "QLD"