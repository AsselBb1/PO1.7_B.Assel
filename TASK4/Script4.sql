SELECT
    f.title,
    cat.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat     ON fc.category_id = cat.category_id
ORDER BY f.title
LIMIT 20;



SELECT
	*
FROM
	customer
WHERE
	email = NULL;

SELECT
	first_name,
	last_name,
	email
FROM
	customer
WHERE
	email IS NULL;

SELECT
	first_name,
	last_name,
	email
FROM
	customer
WHERE
	email IS NOT NULL;




SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating 
ORDER BY film_count DESC;



SELECT 
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC
LIMIT 10;

SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    ROUND(SUM(p.amount), 2) AS total_paid
FROM customer c
JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 150
ORDER BY total_paid DESC;