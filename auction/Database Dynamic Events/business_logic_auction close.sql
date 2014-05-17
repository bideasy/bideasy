DELIMITER //
DROP PROCEDURE IF EXISTS business_logic //
CREATE  PROCEDURE business_logic()
BEGIN


DECLARE d INT DEFAULT 0;

DECLARE my_auction_reserved_price,my_auction_start_price,my_auction_bidder_id,my_auction_id INT;


DECLARE cur CURSOR FOR SELECT auction_reserved_price,auction_start_price,auction_bidder_id,
auction_id
FROM auction where auction_end_date<=curdate() 
and is_auction_authenticated=1 and auction_closed=0;

   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET d=1;

   DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET d=1;

   OPEN cur;
   lbl: LOOP
    IF d=1 THEN
    LEAVE lbl;
    END IF;
    IF NOT d=1 THEN

FETCH cur INTO my_auction_reserved_price,my_auction_start_price,my_auction_bidder_id,my_auction_id ;


IF my_auction_reserved_price <= my_auction_start_price THEN

update auction set auction_winner=(select email from members where userID=my_auction_bidder_id)
,auction_close_type='successfully closed Auction'
,auction_closed=1 where auction_id=my_auction_id;
 


ELSE 

update auction set auction_closed=1,
auction_close_type='unsuccessfully closed Auction because reserve price not met' where auction_id=my_auction_id

;

END IF;


END IF;
END LOOP;
    CLOSE cur;

 
   END//
DELIMITER ;
