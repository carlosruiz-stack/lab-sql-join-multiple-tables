use sakila;

# 1. Write a query to display for each store its store ID, city, and country. 

SELECT store_id, address_id FROM store
INNER JOIN address
ON store.store_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id;

#2. Write a query to display how much business, in dollars, each store brought in.

SELECT * FROM payment;
INNER JOIN rental
ON amount.payment_id = rental.rental_id 
INNER JOIN store 
ON store.store_id = rental.rental_id 
GROUP BY store_id; 

# 3. What is the average running time of films by category?

SELECT name, AVG(length)  
FROM film
INNER JOIN category
ON film.film_id = category.film_id
GROUP BY category.name;

#4. Which film categories are longest?

SELECT name AVG(length) AS avg_length
FROM film
INNER JOIN category
ON film.film_id = category.category_id
GROUP BY category.name
ORDER BY average_length DESC;
