/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT DISTINCT f1.title
FROM (
    SELECT title
    FROM film
    WHERE special_features @> ARRAY['Behind the Scenes']
) f1
INNER JOIN (
    SELECT title
    FROM film
    WHERE special_features @> ARRAY['Trailers']
) f2
ON f1.title = f2.title
ORDER BY f1.title;
