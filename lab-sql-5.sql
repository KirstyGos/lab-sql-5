USE sakila;

#1. Drop column picture from staff
SELECT *
FROM staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT *
FROM staff;

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly. ###?
SELECT *
FROM customer;

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, llast_update)
SELECT (customer_id, first_name, last_name, address_id, email, store_id, active, last_update)
FROM customer;



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

SELECT *
FROM customer
WHERE active = 0;alter;

CREATE TABLE deleted_users (
	customer_id int(11) NOT NULL, # primary key. Integer with 11 spaces, default null - if we forget to put a value in 
    store_id int(11) NOT NULL, # default key
    first_name text,
    last_name text,
    email text,
    address_id int(11) default null,
    active int(2) default null,
    create_date int(20) default null,
    last_update int(20) default null

);



INSERT INTO deleted_users VALUES      #can insert multiple rows using same 
	(16, 2, "SANDRA", "MARTIN", "SANDRA.MARTIN@sakilacustomer.org", 20, 0, "2006-02-14 22:04:36", "2006-02-15 04:57:20"),
    (64, 2, "JUDITH", "COX", "JUDITH.COX@sakilacustomer.org", 68, 0, "2006-02-14 22:04:36", "2006-02-15 04:57:20"),
    (124, 1, "SHEILA", "WELLS", "SHEILA.WELLS@sakilacustomer.org", 128, 0, "2006-02-14 22:04:36", "2006-02-15 04:57:20"),
    (169, 2, "ERICA", "MATTHEWS", "ERICA.MATTHEWS@sakilacustomer.org", 173, 0, "2006-02-14 22:04:36", "2006-02-15 04:57:20"),
	(241, 2, "HEIDI", "LARSON", "HEIDI.LARSON@sakilacustomer.org", 245, 0, "2006-02-14 22:04:36", "2023-02-25 12:45:36"),
	(271, 1, "PENNY", "NEAL", "PENNY.NEAL@sakilacustomer.org", 276, 0, "2006-02-14 22:04:36", "2023-02-25 12:45:36"),
	(315, 2, "KENNETH","GOODEN", "KENNETH.GOODEN@sakilacustomer.org", 320, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(368, 1, "HARRY","ARCE", "HARRY.ARCE@sakilacustomer.org", 373, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(406, 1, "NATHAN','RUNYON", "NATHAN.RUNYON@sakilacustomer.org", 411, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(446, 2, "THEODORE" , "CULP", "THEODORE.CULP@sakilacustomer.org", 451, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(482, 1, "MAURICE", "CRAWLEY", "MAURICE.CRAWLEY@sakilacustomer.org", 487, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(510, 2, "BEN", "EASTER", "BEN.EASTER@sakilacustomer.org", 515, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(534, 1, "CHRISTIAN", "JUNG", "CHRISTIAN.JUNG@sakilacustomer.org", 540, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(558, 1, "JIMMIE','EGGLESTON", "JIMMIE.EGGLESTON@sakilacustomer.org" , 564, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36"),
	(592, 1, "TERRANCE", "ROUSH", "TERRANCE.ROUSH@sakilacustomer.org", 598, 0, "2006-02-14 22:04:37", "2023-02-25 12:45:36");
    
    
    SELECT *
    FROM backup_table
    LIMIT 10;
    
    SET FOREIGN_KEY_CHECKS = 0;
    
    DELETE FROM customer
    WHERE active = 0;
    
    SET FOREIGN_KEY_CHECKS = 1;