use sakila;

# 1. Write a query to display for each store its store ID, city, and country. 

SELECT store_id, city, country
FROM store
INNER JOIN address
ON store.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id;

#2. Write a query to display how much business, in dollars, each store brought in.

SELECT *
FROM payment;

SELECT store.store_id  AS revenue 
FROM store 
INNER JOIN staff 
ON store.store_id = staff.store_id
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY store_id;

# 3. What is the average running time of films by category?

SELECT name, AVG(length)  AS average_length
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name;

#4. Which film categories are longest?

SELECT name AVG(length) AS avg_length
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY average_length DESC;

# 5. Display the most frequently rented movies in descending order.

SELECT film.film_id, title, COUNT(rental_id) AS num_of_rentals
FROM film 
INNER JOIN inventory
ON film.film_id = inventory.film_id
INNER JOIN rental
ON inventory.inventory_id = rental.inventory_id
GROUP BY film_id
ORDER BY num_of_rentals DESC;

#6. List the top five genres in gross revenue in descending order.

SELECT category.name, (SUM(payment.amount)) AS gross_rev
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
INNER JOIN inventory
ON film_category.film_id = inventory.film_id
INNER JOIN rental
ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment
ON rental.rental_id = payment.rental_id
GROUP BY category.name
ORDER BY gross_rev DESC

