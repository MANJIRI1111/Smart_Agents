DELIMITER $$

Create Procedure InsOrders(IN ProdName varchar(50), IN Qty int)
Begin
	DECLARE ProdtID varchar(50);
    DECLARE ProvName varchar(50);
    
    -- Get ProductID and Provider Name for the given product name
    SELECT ProductID, Provider_Name 
    INTO ProdtID, ProvName
    FROM Products
    WHERE ProductName = ProdName;
    
	INSERT INTO Transaction_Db (ProductID, QuantitySold, stockIn_stockOut,Total_Price,Provider_Name,Provider_Shipping_ID,
			ShippingDate, ShippingTime, Shipping_Miles, ArrivalDate, ArrivalTime)
	VALUES (ProdtID, Qty, 0, 32983, ProvName,'P-IN-P00-INIT', CURDATE(), CURTIME(), 
    '50', CURDATE(), CURTIME());
end $$

DELIMITER ;