-- Creamos la tabla old_HDD de nuevo para meter film_id y actor_id
CREATE TABLE old_HDD2
SELECT film_id, actor_id, od.title, od.full_name, od.category_id
FROM film f
INNER JOIN old_HDD od
ON f.title = od.title
INNER JOIN actor a
ON od.full_name = a.full_name
;

DROP TABLE old_HDD;

SELECT * FROM old_HDD2;

ALTER TABLE old_HDD2 
RENAME TO old_HDD;

SELECT * FROM old_HDD;

ALTER TABLE old_HDD
DROP COLUMN title;

ALTER TABLE old_HDD
DROP COLUMN full_name;

-- 

