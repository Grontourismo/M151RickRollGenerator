CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckExpiration`()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN

	select * from pranks;

	update pranks set active = 0 where active = 1 AND Date_Add(createDate, interval 10 hour) < current_timestamp();

	select * from pranks;

END


SET GLOBAL event_scheduler = ON;

CREATE EVENT CallCheckExpiration
    ON SCHEDULE
    EVERY 5 Minute

DO
  CALL `CheckExpiration`();

