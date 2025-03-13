/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
SELECT film_special_features.special_features, COUNT(*) AS count
FROM film,
LATERAL unnest(film.special_features) AS film_special_features(special_features)
GROUP BY film_special_features.special_features
ORDER BY film_special_features.special_features ASC;
