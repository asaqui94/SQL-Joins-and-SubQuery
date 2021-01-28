-- Question 1
SELECT first_name, last_name, email, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--Question2
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--Question 3
SELECT customer_id
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 175 
ORDER BY SUM(amount) ASC;

SELECT*
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id
	HAVING SUM(amount) > 175 
	ORDER BY SUM(amount) ASC
);

--Question 4
SELECT first_name, last_name, email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--Question 5
SELECT staff_id, COUNT(staff_id) as Amount_Sold
FROM rental
GROUP BY staff_id
ORDER BY Amount_Sold DESC
LIMIT 1;


SELECT first_name, last_name, staff.staff_id
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
WHERE staff.staff_id = 1
LIMIT 1;

--Question 6
SELECT DISTINCT rating
FROM film;

SELECT COUNT(rating)
FROM film
WHERE rating = 'NC-17';

SELECT COUNT(rating)
FROM film
WHERE rating = 'G';

SELECT COUNT(rating)
FROM film
WHERE rating = 'PG';

SELECT COUNT(rating)
FROM film
WHERE rating = 'PG-13';

SELECT COUNT(rating)
FROM film
WHERE rating = 'R';

--Question 7
SELECT COUNT(DISTINCT customer_id)
FROM payment
GROUP BY amount
HAVING amount > 6.99 AND COUNT(DISTINCT customer_id) = 1
ORDER BY amount ASC;


SELECT *
FROM customer
WHERE customer_id IN(
	SELECT COUNT(DISTINCT customer_id)
	FROM payment
	GROUP BY amount
	HAVING amount > 6.99 AND COUNT(DISTINCT customer_id) = 1
	ORDER BY amount ASC
);

--Question 8
SELECT COUNT(amount)
FROM payment 
WHERE amount = 0;