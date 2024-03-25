-- Sql Project


use mavenmovies;

-- 1. Write a SQL query to count the number of characters except for the spaces for each actor. 
-- Return the first 10 actors'names lengths along with their names.

use mavenmovies;

select concat((first_name),space(1),(last_name)) as fullname,
length(concat((first_name),space(1),(last_name))) as length
from actor
limit 10;


-- 2. List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.

      use mavenmovies;
      
      select concat((first_name),space(1),(last_name)) as fullname,
	  length(concat((first_name),space(1),(last_name))) as length, awards
      from actor_award
      where awards='oscar';
      
-- 3.Find the actors who have acted in the film 'Frost Head'.

      use mavenmovies;
      
      select concat((first_name),space(1),(last_name)) as fullname, title
      from actor
      inner join film_actor on actor.actor_id=film_actor.actor_id
      inner join film on film_actor.film_id=film.film_id
      where title='Frost Head';
      

-- 4.Pull all the films acted by the actor ‘Will Wilson.’

     select concat((first_name),space(1),(last_name)) as Actorname, title
     from actor
     inner join film_actor on actor.actor_id=film_actor.actor_id
	 inner join film on film_actor.film_id=film.film_id
     where concat((first_name),space(1),(last_name)) ='Will Wilson';

-- 5.Pull all the films which were rented and return them in the month of May.

     select title ,monthname(return_date),monthname(rental_date) 
     from film f
     inner join inventory i on i.film_id=f.film_id
     inner join rental r on r.inventory_id=i.inventory_id
     where month(return_date)=5 and month(rental_date)=5;
     
-- 6.Pull all the films with ‘Comedy’ category.
   
      select title , name 
      from film f
      inner join film_category fc on fc.film_id=f.film_id
      inner join category c on c.category_id=fc.category_id
       where name ='comedy';
       
  -- ==========================================================================================================================================     
use music_store_database;

-- Q1 Who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1;

-- Q2 Which countries have the most invoices?

select * from invoice;

select count(*) as c ,billing_country
from invoice 
group by billing_country
order by c desc;

-- Q3 What are top 3 values of total invoice?

select * from invoice;

select total from invoice 
order by total desc
limit 3;

 -- Q4 Which city has the best customers? we would like to throw a promotional music festival in the city we made the most money. 
-- write the query that returns one city that has the highest sum of invoice total.
-- return the both the city name & sum of all invoice totals? 

select * from invoice;

select sum(total) as invoice_total,billing_city
from invoice 
group by billing_city
order by invoice_total desc;

-- Q5 write query to return the email,first_name,last_name,genre of all rock music listener.
-- return your list ordered alphabetically by email starting  with A

select distinct email,first_name ,last_name
from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in (
              select track_id from track
              join genre on track.genre_id=genre.genre_id
              where genre.name like 'Rock'
		)
         order by email;     
 

-- Q8 Return all the track name that have a song length longer than the average song length. 
-- return the name and the milliseconds for each track.
-- order by the song length with the longest song listed first. 

select name, milliseconds 
from track
where milliseconds > (
            select avg (milliseconds ) as avg_track_length
            from track)
order by milliseconds desc;











