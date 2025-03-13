/*
 * Compute the total revenue for each film.
 */
SELECT
        f.title,
	COALESCE(SUM(p.amount), 0.00) AS revenue
FROM
    film f
LEFT JOIN
	inventory USING (film_id)
LEFT JOIN 
	rental USING (inventory_id)
LEFT JOIN 
	payment p USING (rental_id)
GROUP BY
    f.title
ORDER BY
    revenue DESC, f.title ASC;;
