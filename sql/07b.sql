/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT DISTINCT f.title
FROM film f
JOIN inventory ON f.film_id = inventory.film_id
LEFT JOIN (
    SELECT DISTINCT inventory.film_id
    FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN customer ON rental.customer_id = customer.customer_id
    JOIN address ON customer.address_id = address.address_id
    JOIN city ON address.city_id = city.city_id
    JOIN country ON city.country_id = country.country_id
    WHERE country.country = 'United States'
) AS us_rented_films ON f.film_id = us_rented_films.film_id
WHERE us_rented_films.film_id IS NULL
ORDER BY f.title;

