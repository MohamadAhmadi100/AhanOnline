CREATE TABLE Profit(
    Product VARCHAR(200) NOT NULL UNIQUE,
    ProfitRatio DECIMAL(3, 1) NOT NULL DEFAULT 10.0
);
CREATE TABLE Sales(
	SalesID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderID SMALLINT UNSIGNED NOT NULL,
    Product VARCHAR(200),
    Customer VARCHAR(200) NOT NULL,
    `Date` SMALLINT NOT NULL,
    Quantity INT UNSIGNED NOT NULL,
    UnitPrice INT UNSIGNED NOT NULL,
    FOREIGN KEY (Product) REFERENCES Profit(Product)
);

-- INSERT INTO Profit (Product, ProfitRatio)
-- VALUES('P6', 10);
-- SELECT * FROM profit

-- INSERT INTO Sales (OrderID, Customer, Product, `Date`, Quantity, UnitPrice)
-- VALUES(4,'C4','P3', 1, 1, 300);
-- ---------------------------------------------------------------------------------------------------
SELECT SUM(Quantity * UnitPrice) FROM sales; -- # 1
-- ---------------------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT Customer) FROM sales; -- # 2
-- ---------------------------------------------------------------------------------------------------
SELECT Product, SUM(Quantity * UnitPrice) FROM Sales  
GROUP BY Product;     -- # 3
-- ---------------------------------------------------------------------------------------------------
SELECT Customer, SUM(Quantity*UnitPrice) AS total, COUNT(Customer) AS num, SUM(Quantity) AS items 
FROM Sales 
GROUP BY Customer 
HAVING total > 1500; -- # 4
-- ---------------------------------------------------------------------------------------------------
SELECT SUM((ProfitRatio/100) * (Quantity * UnitPrice)) AS profit_value,
 SUM((ProfitRatio/100) * (Quantity * UnitPrice)) / SUM(Quantity * UnitPrice) * 100 AS profit_percent
FROM Sales 
JOIN Profit ON Profit.Product = Sales.Product; -- # 5
