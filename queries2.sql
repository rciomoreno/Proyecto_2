
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE actor
ADD full_name VARCHAR(40);

UPDATE actor
SET full_name = concat(first_name, ' ', last_name)
;


ALTER TABLE old_HDD
ADD full_name VARCHAR(40);

SELECT * FROM old_HDD;

UPDATE old_HDD
SET full_name = concat(first_name, ' ', last_name)
;


ALTER TABLE old_HDD
DROP last_name 
;

ALTER TABLE old_HDD
DROP first_name
;

SELECT * FROM actor;

-- borro la columna de release_year porque es toda '2006'
ALTER TABLE film
DROP COLUMN release_year;

SELECT title, `deleted scenes`
FROM film
WHERE `deleted scenes` = 'Y' AND rating = 'G'
;

-- Películas en inglés
SELECT title, name
FROM film f
LEFT JOIN language l 
ON l.language_id = f.language_id
;

-- Número de películas por actor
SELECT full_name, count(title) titles
FROM actor a
LEFT JOIN old_HDD od
ON a.actor_id = od.actor_id
LEFT JOIN film f
ON f.film_id = od.film_id
GROUP BY full_name
;

-- Categoría de todas las películas
SELECT name, title
FROM category c
LEFT JOIN old_HDD od
ON c.category_id = od.category_id
LEFT JOIN film f
ON od.film_id = f.film_id
;

-- Si una película dura más de 100 mins, es larga, si dura menos, es corta
SELECT length,
	CASE WHEN length > 100 THEN 'LONG FILM'
	ELSE 'SHORT FILM' 
    END AS 'movie_duration'
	FROM film;
    
-- 1-Top 3 clientes 
SELECT customer_id, count(f.title) titles
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY customer_id  
ORDER BY count(f.title) DESC
LIMIT 3
;

-- Películas con el replacement_cost más alto
SELECT f.replacement_cost, f.title 
FROM film f
ORDER BY f.replacement_cost DESC
LIMIT 5
;

-- Los empleados que más películas han alquilado
SELECT r.staff_id, count(f.film_id) films
FROM rental r
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
GROUP BY staff_id
ORDER BY count(film_id) DESC
LIMIT 5
;

-- Número de películas por género
SELECT name, count(title) titles
FROM category c
INNER JOIN old_HDD od
ON c.category_id = od.category_id
INNER JOIN film f
ON f.film_id = od.film_id
GROUP BY c.category_id
;

