SELECT * FROM vwStaff

CREATE VIEW vwItemPrices AS
SELECT item_id, item_name, price
FROM Items

CREATE TABLE #TempPurchases (
    purchase_id INT,
    item_id INT,
    quantity INT,
    purchase_date DATE
);

INSERT INTO #TempPurchases (purchase_id, item_id, quantity, purchase_date)
VALUES (1, 101, 2, '2025-03-22'),
       (2, 102, 1, '2025-03-21'),
       (3, 103, 3, '2025-03-20');

	   select * from #TempPurchases

DECLARE @currentRevenue DECIMAL(10, 2);
SET @currentRevenue = (SELECT SUM(total_amount) 
                       FROM Purchases 
                       WHERE MONTH(purchase_date) = MONTH(GETDATE()) 
                       AND YEAR(purchase_date) = YEAR(GETDATE()))

CREATE FUNCTION fnSquare (@input NUMERIC)
RETURNS NUMERIC
AS
BEGIN
    RETURN @input * @input;
END

CREATE PROCEDURE spGetClients
AS
BEGIN
    SELECT * FROM Clients;
END

MERGE INTO Clients AS target
USING Purchases AS source
ON target.client_id = source.client_id
WHEN MATCHED THEN
    UPDATE SET target.total_spent = target.total_spent + source.purchase_amount
WHEN NOT MATCHED BY TARGET THEN
    INSERT (client_id, total_spent)
    VALUES (source.client_id, source.purchase_amount)

CREATE TABLE #StaffInfo (
    staff_id INT,
    staff_name VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO #StaffInfo (staff_id, staff_name, department)
VALUES (1, 'John Doe', 'Sales'),
       (2, 'Jane Smith', 'Marketing')

CREATE FUNCTION fnEvenOdd (@number INT)
RETURNS VARCHAR(4)
AS
BEGIN
    IF @number % 2 = 0
        RETURN 'Even'
    ELSE
        RETURN 'Odd'
END

REATE PROCEDURE spMonthlyRevenue (@month INT, @year INT)
AS
BEGIN
    SELECT SUM(total_amount) AS total_revenue
    FROM Purchases
    WHERE MONTH(purchase_date) = @month
    AND YEAR(purchase_date) = @year;
END

CREATE VIEW vwRecentItemSales AS
SELECT item_id, SUM(quantity) AS total_sales
FROM Purchases
WHERE purchase_date >= DATEADD(MONTH, -1, GETDATE())
GROUP BY item_id

DECLARE @currentDate DATE;
SET @currentDate = GETDATE();
PRINT @currentDate

CREATE VIEW vwHighQuantityItems AS
SELECT item_id, item_name, quantity
FROM Items
WHERE quantity > 100


CREATE TABLE #ClientOrders (
    client_id INT,
    purchase_id INT,
    item_id INT,
    quantity INT
)

INSERT INTO #ClientOrders (client_id, purchase_id, item_id, quantity)
SELECT c.client_id, p.purchase_id, p.item_id, p.quantity
FROM Purchases p
JOIN Clients c ON p.client_id = c.client_id

CREATE PROCEDURE spStaffDetails (@staff_id INT)
AS
BEGIN
    SELECT staff_name, department
    FROM Staff
    WHERE staff_id = @staff_id;
END

CREATE FUNCTION fnAddNumbers (@num1 INT, @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 + @num2;
END


MERGE INTO Items AS target
USING #NewItemPrices AS source
ON target.item_id = source.item_id
WHEN MATCHED THEN
    UPDATE SET target.price = source.new_price
WHEN NOT MATCHED BY TARGET THEN
    INSERT (item_id, price)
    VALUES (source.item_id, source.new_price_)

CREATE VIEW vwStaffSalaries AS
SELECT staff_name, salary
FROM Staff

CREATE PROCEDURE spClientPurchases (@client_id INT)
AS
BEGIN
    SELECT * FROM Purchases
    WHERE client_id = @client_id;
END

CREATE FUNCTION fnStringLength (@input_string VARCHAR(255))
RETURNS INT
AS
BEGIN
    RETURN LEN(@input_string);
END
