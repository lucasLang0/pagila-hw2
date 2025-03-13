/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title
FROM film f
WHERE rating = 'G'
AND 'Trailers' IN (
	SELECT unnest(special_features)
	FROM film f1
	WHERE f1.film_id = f.film_id)
ORDER BY title;
