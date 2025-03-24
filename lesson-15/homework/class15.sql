mployees e
    INNER JOIN OrgHierarchy oh ON e.manager_id = oh.employee_id
)

WITH DepartmentSales AS (
    SELECT department_id, AVG(sales) AS avg_sales
    FROM employees
    GROUP BY department_id
)
SELECT e.employee_id, e.department_id, e.sales
FROM employees e
INNER JOIN DepartmentSales ds ON e.department_id = ds.department_id
WHERE e.sales > ds.avg_sales


SELECT region, AVG(sales) AS avg_sales_per_employee
FROM employees e
WHERE e.sales > 0
GROUP BY region

WITH RECURSIVE EmployeeReports AS (
    SELECT employee_id, manager_id
    FROM employees
    WHERE manager_id = @ManagerId
    UNION ALL
    SELECT e.employee_id, e.manager_id
    FROM employees e
    INNER JOIN EmployeeReports er ON e.manager_id = er.employee_id
)
SELECT * FROM EmployeeReports

WITH SalesCounts AS (
    SELECT employee_id, COUNT(DISTINCT product_id) AS num_products
    FROM sales
    WHERE sales_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY employee_id
)
SELECT employee_id, AVG(num_products) AS avg_products_sold
FROM SalesCounts
GROUP BY employee_id

WITH EmployeeSales AS (
    SELECT employee_id, product_id, SUM(sales) AS total_sales
    FROM sales
    GROUP BY employee_id, product_id
)
SELECT es.employee_id, es.product_id, es.total_sales, pc.category_name
FROM EmployeeSales es
INNER JOIN product_categories pc ON es.product_id = pc.product_id
WHERE es.total_sales > (SELECT AVG(total_sales) FROM EmployeeSales WHERE employee_id = es.employee_id)

WITH RECURSIVE DeptHierarchy AS (
    SELECT department_id, parent_department_id
    FROM departments
    WHERE parent_department_id = @ParentDeptId
    UNION ALL
    SELECT d.department_id, d.parent_department_id
    FROM departments d
    INNER JOIN DeptHierarchy dh ON d.parent_department_id = dh.department_id
)
SELECT * FROM DeptHierarchy

WITH RECURSIVE CategoryDepth AS (
    SELECT category_id, parent_category_id, 1 AS depth
    FROM product_categories
    WHERE parent_category_id IS NULL
    UNION ALL
    SELECT pc.category_id, pc.parent_category_id, cd.depth + 1
    FROM product_categories pc
    INNER JOIN CategoryDepth cd ON pc.parent_category_id = cd.category_id
)
SELECT MAX(depth) AS category_levels FROM CategoryDepth
