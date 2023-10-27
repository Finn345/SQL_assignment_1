 -- First query, we will select all the records from the actor table, usually write in all caps, it doesn't happen in this app
 select * from actor;
 
 -- Query for first_name and last_name in actor table
 select first_name, last_name
 from actor;
 
-- Query for a first_name that equals nick using the WHERE clause
select first_name, last_name
from actor
where first_name like 'Nick';

-- Can use an equal sign, ex: where first_name = 'Nick'
-- Query for all first_name data that starts with j using a like and where clause and a wild card
-- Wild Card = %

select first_name, actor_id
from actor
where first_name like 'J%';

-- Query for all first_name data that starts with K and has 2 letters after K using like and where clause and the underscore
select first_name, actor_id
from actor
where first_name like 'K__'

-- Query where first_name starts with k and ends in th
select first_name, actor_id
from actor
where first_name like 'K%th'

-- Comparing operators:
-- >, <, >=, <=, <>

-- Explore data with select all query so that we can change into a new table
select * from payment;

-- Query for data that shows customers that paid an amount GREATER than $2
select customer_id, amount from payment
where amount > 2.00;

-- Query for data that shows customers that paid an amount less than 7.99
select customer_id, amount
from payment
where amount < 7.99;

-- Query for data that shows customers that pad less than or equal to 7.99
select customer_id, amount
from payment
where amount <= 7.99;

-- Query where customer paid greater than or equal to 2
select customer_id, amount from payment
where amount >= 2.00;

-- Query for an amount where customers paid an amount not equal to 0 in descending order
select customer_id, amount
from payment
where amount <> 0.00
order by amount desc;

-- SQL Aggregate Functions: Sum, avg, count, min, max
-- Query to display the sum of amounts paid that are greater than 5.99
select sum(amount)
from payment
where amount > 5.99;

-- Query to display the average of amounts paid greater than 5.99
select avg(amount)
from payment

-- Query to display the count of amounts paid greater than 5.99
select count(amount)
from payment
where amount > 5.99;

-- Query to display the count of DISTINCIT amounts paid greater than 5.99
select count(distinct amount)
from payment
where amount > 5.99;

-- Query to display min amount greater than 7.99
select min(amount) as min_num_payments
from payment
where amount > 7.99;

-- Query to display max amount greater than 7.99
select max(amount) as max_num_payments
from payment
where amount > 7.99;

-- Demo of groupby
select amount
from payment

-- Query to display different amounts grouped together
-- and count the amounts
select amount, count(amount)
from payment
group by amount 
order by amount;
where amount = 7.99;

-- Query to display customer ids with the summed amounts for each customer id
select customer_id, sum(amount)
from payment
group by customer_id 
order by customer_id desc;


--HOMEWORK
-- Number 1: How many actors have last name Wahlberg
select first_name, last_name
from actor
where last_name like 'Wahlberg';

-- Number 2: How many payments were made between 3.99 and 5.99
select amount
from payment
where amount between 3.99 and 5.99;

-- Number 3: What film does the store have the most of? (search in inventory)

select film_id 
from inventory
group by film_id 
order by count(*) desc;

-- Number 4: How many customers have the last name william
select Last_name
from Customer
where Last_name = 'William';

-- Number 5: What store employee (get the id) has sold the most rentals
select count(*)
from rental
where staff_id = 1;

select count(*)
from rental
where staff_id = 2;

-- Number 6: How many different district names are there
select count(distinct district)
from address;

-- Number 7: Which film has the most actors in it (use film_actor table and get film_id)
select film_id
from film_actor;

-- Number 8: From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select last_name
from customer
where last_name like '%es';

-- Number 9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(*) as rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP by amount
HAVING amount > 250;

-- Number 10: Within the film table, how many rating categories are there? And what rating has the most  movies total?

select rating, count(*) as TOTAl
from film
group by(rating);