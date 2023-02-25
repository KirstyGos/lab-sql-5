USE bank;
drop table if exists deleted_users;

USE sakila;

#1. Drop column picture from staff

#view the staff table
SELECT *
FROM staff;

# change the table so you drop the column 'picture'
ALTER TABLE staff
DROP COLUMN picture;

SELECT *
FROM staff;

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly. ###?
# view Tammy's details in the customer table
SELECT *
FROM customer
WHERE first_name = "TAMMY";

# find out the columns in staff table
SELECT *
FROM staff;

# add Tammy's information
INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES (3, "TAMMY", "SANDERS", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, "TAMMY", "N/A", NOW());

# double check Tammy in staff table
SELECT *
FROM staff
WHERE first_name = "TAMMY";


# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

# select customer_id from sakila.customer
# where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# Use similar method to get inventory_id, film_id, and staff_id

SELECT * 
FROM film
WHERE title = "Academy Dinosaur";

SELECT *
FROM rental;

SELECT inventory_id
FROM inventory
WHERE film_id = 1;

SELECT customer_id FROM customer
WHERE first_name = "CHARLOTTE" AND last_name = "HUNTER";

SELECT staff_id
FROM staff
WHERE first_name = "Mike" AND last_name = "Hillyer";

SELECT rental_id
FROM rental
ORDER BY rental_id DESC;

INSERT INTO rental  #rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
VALUES (16050, "2023-02-25 12:24:52", 4, 130, null, 1, "2023-02-25 12:24:52");

SELECT *
FROM rental
WHERE rental_id = 1;


# 4. 
SELECT DISTINCT active 
FROM customer;

# Check if there are any non-active users
SELECT *
FROM customer
WHERE active = 0;

# Create a table backup table as suggested
CREATE TABLE deleted_users (
	customer_id int(11) NOT NULL, # primary key. Integer with 11 spaces, default null - if we forget to put a value in 
    email text,
    date text
   
);

drop table if exists backup_table;

# Insert the non active users in the table backup table
INSERT INTO deleted_users VALUES      #can insert multiple rows using same script
	(16, "SANDRA.MARTIN@sakilacustomer.org", NOW()),
    (64, "JUDITH.COX@sakilacustomer.org", NOW()),
    (124, "SHEILA.WELLS@sakilacustomer.org", NOW()),
    (169, "ERICA.MATTHEWS@sakilacustomer.org", NOW()),
	(241, "HEIDI.LARSON@sakilacustomer.org", NOW()),
	(271, "PENNY.NEAL@sakilacustomer.org", NOW()),
	(315, "KENNETH.GOODEN@sakilacustomer.org", NOW()),
	(368, "HARRY.ARCE@sakilacustomer.org", NOW()),
	(406, "NATHAN.RUNYON@sakilacustomer.org", NOW()),
	(446, "THEODORE.CULP@sakilacustomer.org", NOW()),
	(482, "MAURICE.CRAWLEY@sakilacustomer.org", NOW()),
	(510, "BEN.EASTER@sakilacustomer.org", NOW()),
	(534, "CHRISTIAN.JUNG@sakilacustomer.org", NOW()),
	(558, "JIMMIE.EGGLESTON@sakilacustomer.org" , NOW()),
	(592, "TERRANCE.ROUSH@sakilacustomer.org", NOW());
    
    
# check the deleted_users table
SELECT *
FROM deleted_users
LIMIT 10;
    
SET FOREIGN_KEY_CHECKS = 0;
    
# delete inactive users 
DELETE FROM customer
WHERE active = 0;
    
SET FOREIGN_KEY_CHECKS = 1;
    
SELECT *
FROM customer
WHERE active = 0;
    