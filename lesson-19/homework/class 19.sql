SELECT employee_id, employee_name, salary, 
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM Employees

SELECT product_id, product_name, price, 
       RANK() OVER (ORDER BY price DESC) AS rank
FROM Products

SELECT employee_id, employee_name, salary, 
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employees

SELECT employee_id, employee_name, department_id, salary, 
       LEAD(salary) OVER (PARTITION BY department_id ORDER BY salary) AS next_salary
FROM Employees

SELECT order_id, order_date, customer_id, 
       ROW_NUMBER() OVER (ORDER BY order_date) AS row_num
FROM Orders

SELECT employee_id, employee_name, salary, 
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employees
WHERE salary_rank <= 2

SELECT employee_id, employee_name, salary, 
       LAG(salary) OVER (ORDER BY salary) AS previous_salary
FROM Employees;
Use NTILE(4) to divide employees into 4 groups based on their Salary.

sql
Копировать
SELECT employee_id, employee_name, salary, 
       NTILE(4) OVER (ORDER BY salary DESC) AS salary_group
FROM Employees;
Write a query to partition employees by DepartmentID and assign a row number within each department.

sql
Копировать
SELECT employee_id, employee_name, department_id, salary, 
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM Employees;
Use DENSE_RANK() to rank products by Price in ascending order.

sql
Копировать
SELECT product_id, product_name, price, 
       DENSE_RANK() OVER (ORDER BY price ASC) AS price_rank
FROM Products;
Write a query to calculate the moving average of Price in the Products table using window functions.

sql
Копировать
SELECT product_id, product_name, price,
       AVG(price) OVER (ORDER BY product_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_price
FROM Products;
Use the LEAD() function to display the salary of the next employee for each row in the Employees table.

sql
Копировать
SELECT employee_id, employee_name, salary, 
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM Employees;
Create a query to compute the cumulative sum of SalesAmount in the Sales table.

sql
Копировать
SELECT sale_id, product_id, sales_amount, 
       SUM(sales_amount) OVER (ORDER BY sale_date) AS cumulative_sales
FROM Sales;
Use ROW_NUMBER() to identify the top 5 most expensive products in the Products table.

sql
Копировать
SELECT product_id, product_name, price, 
       ROW_NUMBER() OVER (ORDER BY price DESC) AS rank
FROM Products
WHERE rank <= 5;
Write a query to partition the Orders table by CustomerID and calculate the total OrderAmount per customer.

sql
Копировать
SELECT customer_id, order_id, order_date, 
       SUM(order_amount) OVER (PARTITION BY customer_id) AS total_order_amount
FROM Orders;
Use RANK() to rank orders in the Orders table based on their OrderAmount.

sql
Копировать
SELECT order_id, customer_id, order_date, order_amount, 
       RANK() OVER (ORDER BY order_amount DESC) AS order_rank
FROM Orders;
Write a query to compute the percentage contribution of SalesAmount by ProductCategory in the Sales table.

sql
Копировать
SELECT product_category, SUM(sales_amount), 
       SUM(sales_amount) * 100.0 / SUM(SUM(sales_amount)) OVER () AS percentage_contribution
FROM Sales
GROUP BY product_category;
Use the LEAD() function to retrieve the next order date for each order in the Orders table.

sql
Копировать
SELECT order_id, customer_id, order_date, 
       LEAD(order_date) OVER (ORDER BY order_date) AS next_order_date
FROM Orders;
Write a query using NTILE(3) to divide employees into 3 groups based on their Age.

sql
Копировать
SELECT employee_id, employee_name, age, 
       NTILE(3) OVER (ORDER BY age) AS age_group
FROM Employees;
Use ROW_NUMBER() to list the most recently hired employees from the Employees table.

sql
Копировать
SELECT employee_id, employee_name, hire_date, 
       ROW_NUMBER() OVER (ORDER BY hire_date DESC) AS row_num
FROM Employees;
Medium Tasks
Write a query to compute the cumulative average salary of employees, ordered by Salary.

sql
Копировать
SELECT employee_id, employee_name, salary,
       AVG(salary) OVER (ORDER BY salary) AS cumulative_avg_salary
FROM Employees;
Use RANK() to rank products by their total sales while handling ties appropriately.

sql
Копировать
SELECT product_id, product_name, 
       SUM(sales_amount) AS total_sales, 
       RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM Sales
GROUP BY product_id, product_name

SELECT order_id, customer_id, order_date, 
       LAG(order_date) OVER (ORDER BY order_date) AS previous_order_date
FROM Orders

SELECT product_id, product_name, price,
       SUM(price) OVER (ORDER BY product_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_sum_price
FROM Products

SELECT employee_id, employee_name, salary, 
       NTILE(4) OVER (ORDER BY salary DESC) AS salary_range
FROM Employees

SELECT product_id, sales_date, sales_amount, 
       SUM(sales_amount) OVER (PARTITION BY product_id) AS total_sales
FROM Sales
Use DENSE_RANK() to rank products by StockQuantity without gaps in the ranking

SELECT product_id, product_name, stock_quantity, 
       DENSE_RANK() OVER (ORDER BY stock_quantity DESC) AS stock_rank
FROM Products


SELECT employee_id, employee_name, department_id, salary
FROM (
    SELECT employee_id, employee_name, department_id, salary, 
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
    FROM Employees
) AS ranked
WHERE row_num = 2;
Write a query to calculate the running total of sales for each product in the Sales table.

sql
Копировать
SELECT product_id, sales_date, sales_amount, 
       SUM(sales_amount) OVER (PARTITION BY product_id ORDER BY sales_date) AS running_total
FROM Sales;
Use LEAD() to display the SalesAmount of the next row for each employee’s sale in the Sales table.

sql
Копировать
SELECT employee_id, sales_date, sales_amount, 
       LEAD(sales_amount) OVER (PARTITION BY employee_id ORDER BY sales_date) AS next_sales_amount
FROM Sales;
Difficult Tasks
Write a query using RANK() to rank products by their sales (handling ties) but exclude the top 10% of products by sales.

sql
Копировать
WITH ProductSales AS (
    SELECT product_id, SUM(sales_amount) AS total_sales
    FROM Sales
    GROUP BY product_id
)
SELECT product_id, total_sales, 
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM ProductSales
WHERE sales_rank > (SELECT ROUND(COUNT(*) * 0.1) FROM ProductSales);
Use ROW_NUMBER() to list employees with over 5 years of service, ordered by their HireDate.

sql
Копировать
SELECT employee_id, employee_name, hire_date, 
       ROW_NUMBER() OVER (ORDER BY hire_date) AS row_num
FROM Employees
WHERE DATEDIFF(YEAR, hire_date, GETDATE()) > 5;

SELECT employee_id, employee_name, salary, 
       NTILE(10) OVER (ORDER BY salary DESC) AS salary_group
FROM Employees

SELECT employee_id, sales_date, sales_amount,
       LEAD(sales_amount) OVER (PARTITION BY employee_id ORDER BY sales_date) AS next_sales_amount,
       LEAD(sales_amount) OVER (PARTITION BY employee_id ORDER BY sales_date) - sales_amount AS difference
FROM Sales

SELECT category_id, AVG(price) AS avg_price
FROM Products
GROUP BY category_id

SELECT product_id, product_name, SUM(sales_amount) AS total_sales, 
       RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM Sales
GROUP BY product_id, product_name
HAVING sales_rank <= 3

SELECT employee_id, employee_name, department_id, salary
FROM (
    SELECT employee_id, employee_name, department_id, salary,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
    FROM Employees
) AS ranked
WHERE row_num <= 5

SELECT sales_date, sales_amount,
       AVG(sales_amount) OVER (ORDER BY sales_date ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS moving_avg_sales
FROM Sales

SELECT product_id, product_name, SUM(sales_amount) AS total_sales,
       DENSE_RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM Sales
GROUP BY product_id, product_name
HAVING sales_rank <= 5

SELECT order_id, customer_id, order_amount, 
       NTILE(4) OVER (ORDER BY order_amount DESC) AS order_quartile
FROM Orders
