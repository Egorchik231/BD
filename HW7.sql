
-- TASK 1 --

select * from users 
	where id = (select user_id from orders);
	
-- TASK 2 --

SELECT
  p.name,
  c.name
FROM
  catalogs AS c
JOIN
  products AS p
ON
  c.id = p.catalog_id;
  
 -- TASK 3 --

-- Не осилил. Где можно разобрать решение?



