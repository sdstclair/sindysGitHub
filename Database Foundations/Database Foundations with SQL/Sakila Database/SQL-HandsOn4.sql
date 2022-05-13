-- Part 1
-- Run the following queries:
-- Create a view named "initialCustomers" that shows the first name, last name, and email
-- address of customers that have an id of less than 100. Once that is complete, select and
-- view your newly created view.

create view initialCustomers as
select first_name, last_name, email, customer_id
from customer
where customer_id < 100

SELECT * FROM initialCustomers;

-- Part 2
-- Create a table named "ProductList". Include the following columns:
-- ProductId, ProductName, Price, DateAdded, EmployeeSupportId. Include the following 
-- requirements: Every product should have an automatically generated id number that should be
-- unique for each product. Give each column a data type that would apply. Give the DateAdded
-- column a default value for the current local time. All columns CANNOT be null.

CREATE TABLE ProductList (
	ProductID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    Price NUMERIC(9,2) NOT NULL,
    EmployeeSupportID integer NOT NULL,
    DateAdded datetime default current_timestamp);
    
SELECT * FROM ProductList

insert into ProductList(ProductName, Price, EmployeeSupportID)
values ("TV Fire Stick", 29.99, 0123456789)

