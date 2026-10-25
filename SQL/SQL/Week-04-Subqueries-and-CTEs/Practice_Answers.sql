
-- Week 4: Practice Answers - Subqueries and CTEs
-- Database: SQL Server

-- Q1. Find employees earning more than the average salary.
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);

-- Q2. Find employee(s) with the highest salary.
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
);

-- Q3. Find employees working in the IT department.
SELECT EmployeeName, DepartmentID
FROM Employee
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'IT'
);

-- Q4. Find departments without employees.
SELECT d.DepartmentID, d.DepartmentName
FROM Department AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee AS e
    WHERE e.DepartmentID = d.DepartmentID
);

-- Q5. Find departments that have employees.
SELECT d.DepartmentID, d.DepartmentName
FROM Department AS d
WHERE EXISTS (
    SELECT 1
    FROM Employee AS e
    WHERE e.DepartmentID = d.DepartmentID
);

-- Q6. Employees earning more than at least one employee in Department 2.
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ANY (
    SELECT Salary
    FROM Employee
    WHERE DepartmentID = 2
);

-- Q7. Employees earning more than every employee in Department 2.
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ALL (
    SELECT Salary
    FROM Employee
    WHERE DepartmentID = 2
);

-- Q8. Employees earning more than their department's average salary.
SELECT e.EmployeeName, e.DepartmentID, e.Salary
FROM Employee AS e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee AS e2
    WHERE e2.DepartmentID = e.DepartmentID
);

-- Q9. CTE: Employees earning more than 50000.
WITH HighSalaryEmployees AS (
    SELECT EmployeeID, EmployeeName, Salary
    FROM Employee
    WHERE Salary > 50000
)
SELECT *
FROM HighSalaryEmployees;

-- Q10. Count employees in each department using a CTE.
WITH DepartmentCounts AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employee
    GROUP BY DepartmentID
)
SELECT *
FROM DepartmentCounts;

-- Q11. Departments with more than five employees using multiple CTEs.
WITH DepartmentCounts AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employee
    GROUP BY DepartmentID
),
LargeDepartments AS (
    SELECT DepartmentID, EmployeeCount
    FROM DepartmentCounts
    WHERE EmployeeCount > 5
)
SELECT *
FROM LargeDepartments;

-- Q12. Find employee(s) with the second-highest distinct salary.
WITH SalaryRanking AS (
    SELECT EmployeeName, Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employee
)
SELECT EmployeeName, Salary
FROM SalaryRanking
WHERE SalaryRank = 2;

-- Q13. Transactions greater than the average transaction amount.
SELECT TransactionID, CustomerID, TransactionAmount
FROM Transactions
WHERE TransactionAmount > (
    SELECT AVG(TransactionAmount)
    FROM Transactions
);

-- Q14. Customers without any transactions.
SELECT c.CustomerID
FROM Customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM Transactions AS t
    WHERE t.CustomerID = c.CustomerID
);

-- Q15. Total transaction amount for each customer using a CTE.
WITH CustomerTransactionSummary AS (
    SELECT CustomerID,
           COUNT(*) AS TransactionCount,
           SUM(TransactionAmount) AS TotalTransactionAmount
    FROM Transactions
    GROUP BY CustomerID
)
SELECT *
FROM CustomerTransactionSummary;
