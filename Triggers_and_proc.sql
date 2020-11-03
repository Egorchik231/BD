DROP TRIGGER IF EXISTS `check_mail_phone_not_null`;
DELIMITER //
CREATE TRIGGER `check_mail_phone_not_null` BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	if (NEW.email is NULL or NEW.phone IS NULL) then
		signal sqlstate '45000' SET MESSAGE_TEXT = 'Insert canceled';
	end if;
	
end //
DELIMITER ;

DROP PROCEDURE IF EXISTS `add_VIP_Ban`;

DELIMITER //
CREATE PROCEDURE `add_VIP_Ban` (IN Inid int, IN Invip int, IN Inban int )
BEGIN
  UPDATE USERS 
 	SET VIP = INVIP,
 		ISBANNED = INBAN
 	WHERE ID = inid;
END//
DELIMITER ;
-- Процедура обновляет данные о наличии вип статуса у игрока и блокировки на аккаунте


CALL `add_VIP_Ban`(25, 1, 0);