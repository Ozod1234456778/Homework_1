SELECT ProductID,
       SaleDate,
       SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS RunningTotal
FROM Sales
ORDER BY ProductID, SaleDate

SELECT CustomerID,
       OrderID,
       OrderDate,
       OrderAmount,
       SUM(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningTotal
FROM Orders

SELECT ProductID,
       SaleDate,
       SalesAmount,
       AVG(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MovingAvg
FROM Sales;
Rank Each Order’s OrderAmount Using the RANK() Window Function

SELECT OrderID,
       OrderAmount,
       RANK() OVER (ORDER BY OrderAmount DESC) AS OrderRank
FROM Orders


SELECT ProductID,
       SaleDate,
       SalesAmount,
       LEAD(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS NextSalesAmount
FROM Sales

SELECT CustomerID,
       SUM(OrderAmount) OVER (PARTITION BY CustomerID) AS TotalSales
FROM Orders
Number of Orders Placed Up to the Current Row in the Orders Table

SELECT OrderID,
       CustomerID,
       OrderDate,
       OrderAmount,
       COUNT(OrderID) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS OrdersCount
FROM Orders

SELECT ProductCategory,
       SaleDate,
       SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY ProductCategory ORDER BY SaleDate) AS RunningTotal
FROM Sales;
ROW_NUMBER() to Assign a Unique Rank to Each Order in the Orders Table, Ordered by OrderDate

SELECT OrderID,
       OrderDate,
       OrderAmount,
       ROW_NUMBER() OVER (ORDER BY OrderDate) AS RowNum
FROM Orders

SELECT OrderID,
       CustomerID,
       OrderDate,
       OrderAmount,
       LAG(OrderAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PrevOrderAmount
FROM Orders;
NTILE(4) to Divide Products Based on Price in 4 Groups
sql
Копировать
SELECT ProductID,
       Price,
       NTILE(4) OVER (ORDER BY Price DESC) AS PriceGroup
FROM Products;
SUM() to Calculate the Cumulative Total of Sales for Each Salesperson
sql
Копировать
SELECT SalespersonID,
       SaleDate,
       SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY SalespersonID ORDER BY SaleDate) AS CumulativeSales
FROM Sales;
DENSE_RANK() to Rank Products in the Products Table Based on StockQuantity
sql
Копировать
SELECT ProductID,
       StockQuantity,
       DENSE_RANK() OVER (ORDER BY StockQuantity DESC) AS StockRank
FROM Products;
Difference Between the Current and Next OrderAmount Using LEAD()
sql
Копировать
SELECT OrderID,
       OrderAmount,
       LEAD(OrderAmount) OVER (ORDER BY OrderDate) - OrderAmount AS DifferenceFromNext
FROM Orders;
RANK() to Assign a Rank to Products Ordered by Price
sql
Копировать
SELECT ProductID,
       Price,
       RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Products;
AVG() to Calculate the Average Order Amount for Each Customer
sql
Копировать
SELECT CustomerID,
       AVG(OrderAmount) OVER (PARTITION BY CustomerID) AS AvgOrderAmount
FROM Orders;
ROW_NUMBER() to Assign a Unique Row Number to Each Employee Ordered by Salary
sql
Копировать
SELECT EmployeeID,
       Salary,
       ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Employees;
Partition Sales Table by StoreID and Calculate the Cumulative Sum of SalesAmount for Each Store
sql
Копировать
SELECT StoreID,
       SaleDate,
       SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY StoreID ORDER BY SaleDate) AS CumulativeSales
FROM Sales;

SELECT OrderID,
       OrderAmount,
       LAG(OrderAmount) OVER (ORDER BY OrderDate) AS PrevOrderAmount
FROM Orders

SELECT EmployeeID,
       SaleDate,
       SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS RunningTotal
FROM Sales
LEAD() to Retrieve the SalesAmount of the Next Sale for Each Product

SELECT ProductID,
       SaleDate,
       SalesAmount,
       LEAD(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate) AS NextSalesAmount
FROM Sales

SELECT ProductID,
       SaleDate,
       SalesAmount,
       SUM(SalesAmount) OVER (PARTITION BY ProductID ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingSum
FROM Sales

Rank Employees by Salary Within Each Department Using RANK()
SELECT EmployeeID,
       DepartmentID,
       Salary,
       RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS DeptSalaryRank
FROM Employees;
ROW_NUMBER() to Rank Employees by Salary Within Each Department

SELECT EmployeeID,
       DepartmentID,
       Salary,
       ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RowNum
FROM Employees;
RANK() to Determine the Top 3 Most Sold Products (Handling Ties)

SELECT ProductID,
       SalesAmount,
       RANK() OVER (ORDER BY SalesAmount DESC) AS ProductRank
FROM Products
WHERE RANK() OVER (ORDER BY SalesAmount DESC) <= 3
