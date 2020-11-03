USE counterstrike;

			
SELECT users.NAME AS user_name, maps.NAME AS map_name, maps.OFFICIAL_COMPITITION FROM  users, USERS_ACTIVITY
	JOIN MAPS
		WHERE USERS.ID = USERS_activity.USER_ID AND maps.ID =  USERS_activity.MAP_ID
		GROUP BY users.NAME
		LIMIT 20;
	
	
CREATE OR REPLACE VIEW `userProd_inventary`  as
	SELECT users.NICKNAME, shop_catalogs.NAME AS catalog_name, shop_products.NAME AS prod_name, shop_products.PRICE 
		FROM  shop_products, user_inventory
		JOIN users, shop_catalogs
			where users.id = user_inventory.USER_ID AND shop_catalogs.ID = user_inventory.CATALOG_ID AND shop_products.ID = user_inventory.PRODUCTS_ID ;
		
SELECT * FROM `userProd_inventary`;
-- ѕредставление хранит текстовую информацию о наличии у игроков предметов из магазина и их стоимости

CREATE OR REPLACE VIEW `guns_damage` as
	SELECT g.NAME AS gun_name, gt.NAME AS gun_type, gs.DAMAGE_HEAD, DAMAGE_BODY, gs.DAMAGE_HANDS_FEET
	FROM GUNS AS G , GUN_SETS AS GS
		JOIN GUNS_TYPE AS GT 
			where G.ID = gs.GUN_ID AND g.TYPE_ID = gt.ID;
SELECT * FROM `guns_damage`;
-- ѕредставление показывает основные характеристики оружи€ с их названи€ми


	


