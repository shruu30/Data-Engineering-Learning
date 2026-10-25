
-- Week 4: SQL Subqueries and CTEs
-- Database: SQL Server
-- Practice tables: Employee, Department, Transactions, Customers

-- 1. Single-row subquery
-- Find employees earning more than the average salary.

SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);


-- 2. Multiple-row subquery with IN
-- Find employees working in IT or HR departments.

SELECT EmployeeName, DepartmentID
FROM Employee
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName IN ('IT', 'HR')
);


-- 3. EXISTS
-- Find departments that have employees.

SELECT d.DepartmentID, d.DepartmentName
FROM Department AS d
WHERE EXISTS (
    SELECT 1
    FROM Employee AS e
    WHERE e.DepartmentID = d.DepartmentID
);


-- 4. NOT EXISTS
-- Find departments that have no employees.

SELECT d.DepartmentID, d.DepartmentName
FROM Department AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee AS e
    WHERE e.DepartmentID = d.DepartmentID
);


-- 5. ANY
-- Find employees earning more than at least one employee in department 2.

SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ANY (
    SELECT Salary
    FROM Employee
    WHERE DepartmentID = 2
);


-- 6. ALL
-- Find employees earning more than every employee in department 2.

SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ALL (
    SELECT Salary
    FROM Employee
    WHERE DepartmentID = 2
);


-- 7. Correlated subquery
-- Find employees earning more than their department's average salary.

SELECT e.EmployeeName, e.DepartmentID, e.Salary
FROM Employee AS e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee AS e2
    WHERE e2.DepartmentID = e.DepartmentID
);


-- 8. Basic CTE
-- Find employees earning more than 50000.

WITH HighSalaryEmployees AS (
    SELECT EmployeeID, EmployeeName, Salary
    FROM Employee
    WHERE Salary > 50000
)
SELECT *
FROM HighSalaryEmployees;


-- 9. CTE with GROUP BY
-- Count employees in each department.

WITH DepartmentSummary AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employee
    GROUP BY DepartmentID
)
SELECT *
FROM DepartmentSummary;


-- 10. Multiple CTEs
-- Find departments with more than 5 employees.

WITH DepartmentSummary AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employee
    GROUP BY DepartmentID
),
LargeDepartments AS (
    SELECT DepartmentID, EmployeeCount
    FROM DepartmentSummary
    WHERE EmployeeCount > 5
)
SELECT *
FROM LargeDepartments;


-- 11. AML example: Transactions above the average amount.
-- Assumes Transactions has TransactionID, CustomerID,
-- and TransactionAmount columns.

SELECT TransactionID, CustomerID, TransactionAmount
FROM Transactions
WHERE TransactionAmount > (
    SELECT AVG(TransactionAmount)
    FROM Transactions
);


-- 12. AML example: Customers with no transactions.
-- Assumes Customers has CustomerID and Transactions has CustomerID.

SELECT c.CustomerID
FROM Customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM Transactions AS t
    WHERE t.CustomerID = c.CustomerID
);


-- 13. Recursive CTE example
-- Requires EmployeeID, EmployeeName, and ManagerID columns.
-- Run this query only if your Employee table has ManagerID.

WITH EmployeeHierarchy AS (
    SELECT EmployeeID, EmployeeName, ManagerID, 0 AS HierarchyLevel
    FROM Employee
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.EmployeeName, e.ManagerID,
           h.HierarchyLevel + 1
    FROM Employee AS e
    INNER JOIN EmployeeHierarchy AS h
        ON e.ManagerID = h.EmployeeID
)
SELECT *
FROM EmployeeHierarchy
OPTION (MAXRECURSION 100);
