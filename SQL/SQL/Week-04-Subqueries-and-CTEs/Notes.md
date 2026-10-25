# Week 4 - SQL Subqueries and CTEs Notes

## 1. What Is a Subquery?

A subquery is a SQL query written inside another SQL query.

It is also called a nested query.

### Example

Find employees whose salary is greater than the average salary.

```sql
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);
```

**Explanation:**
- The inner query calculates the average salary.
- The outer query finds employees earning more than that average.

## 2. Types of Subqueries

### A. Single-Row Subquery

Returns one row or one value.

```sql
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);
```

### B. Multiple-Row Subquery

Returns multiple values. Use operators such as `IN` when appropriate.

```sql
SELECT EmployeeName
FROM Employee
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName IN ('IT', 'HR')
);
```

This finds employees belonging to the IT or HR departments.

## 3. IN Operator

`IN` checks whether a value matches any value in a list or subquery result.

```sql
SELECT EmployeeName
FROM Employee
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'IT'
);
```

**Use:** When you want to match values returned by another query.

## 4. EXISTS Operator

`EXISTS` checks whether a subquery returns at least one row.

```sql
SELECT d.DepartmentName
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.DepartmentID = d.DepartmentID
);
```

This returns departments that have at least one employee.

## 5. NOT EXISTS Operator

`NOT EXISTS` checks whether a subquery returns no rows.

```sql
SELECT d.DepartmentName
FROM Department d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.DepartmentID = d.DepartmentID
);
```

This finds departments that have no employees.

**Practical use:** Finding customers who have no transactions or records that are missing from a related table.

## 6. ANY and ALL Operators

These operators compare a value with the results of a subquery.

### ANY

The condition is true if it matches at least one value returned by the subquery.

```sql
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ANY (
    SELECT Salary
    FROM Employee
    WHERE DepartmentID = 2
);
```

This finds employees whose salary is greater than at least one salary in department 2.

### ALL

The condition must be true for every value returned by the subquery.

```sql
SELECT EmployeeName, Salary
FROM Employee
WHERE Salary > ALL (
    SELECT Salary
    FROM Employee
    WHERE DepartmentID = 2
);
```

This finds employees whose salary is greater than every salary in department 2.

## 7. Correlated Subquery

A correlated subquery refers to a column from the outer query. It is evaluated in relation to each outer row.

### Example

Find employees earning more than the average salary in their own department.

```sql
SELECT e.EmployeeName, e.Salary, e.DepartmentID
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.DepartmentID = e.DepartmentID
);
```

**Explanation:**
- The inner query calculates the average salary for the employee's department.
- The outer query returns employees earning more than that department's average.

## 8. What Is a CTE?

CTE stands for **Common Table Expression**.

A CTE is a named temporary result set that makes a query easier to read and organize.

In SQL Server, a CTE is available only to the single statement immediately following its definition.

### Syntax

```sql
WITH CTE_Name AS (
    SELECT columns
    FROM table_name
)
SELECT *
FROM CTE_Name;
```

### Example

Find employees earning more than ₹50,000.

```sql
WITH HighSalaryEmployees AS (
    SELECT EmployeeID, EmployeeName, Salary
    FROM Employee
    WHERE Salary > 50000
)
SELECT *
FROM HighSalaryEmployees;
```

**Explanation:**
- The CTE selects employees earning more than ₹50,000.
- The main query retrieves the CTE results.

## 9. Using Multiple CTEs

You can define multiple CTEs in one statement by separating them with commas.

```sql
WITH DepartmentSummary AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employee
    GROUP BY DepartmentID
),
HighEmployeeDepartments AS (
    SELECT DepartmentID, EmployeeCount
    FROM DepartmentSummary
    WHERE EmployeeCount > 5
)
SELECT *
FROM HighEmployeeDepartments;
```

This identifies departments with more than five employees.

## 10. Recursive CTE — Introduction

A recursive CTE refers to itself and is useful for working with hierarchical data, such as employee-manager relationships.

A recursive CTE generally contains:
- **Anchor member:** Starts the result.
- **Recursive member:** Uses previous results to find more rows.

### Example

```sql
WITH EmployeeHierarchy AS (
    SELECT EmployeeID, EmployeeName, ManagerID, 0 AS Level
    FROM Employee
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.EmployeeName, e.ManagerID, h.Level + 1
    FROM Employee e
    INNER JOIN EmployeeHierarchy h
        ON e.ManagerID = h.EmployeeID
)
SELECT *
FROM EmployeeHierarchy
OPTION (MAXRECURSION 100);
```

This example assumes the `Employee` table contains a `ManagerID` column. It starts with employees who have no manager and then finds their direct and indirect reports.

## 11. Subquery vs CTE

| Subquery | CTE |
|---|---|
| A query nested inside another query | A named result set defined using `WITH` |
| Useful for smaller nested conditions | Useful for organizing complex queries |
| Can sometimes be harder to read when deeply nested | Often improves readability |
| Can appear in different parts of a query, depending on syntax | In SQL Server, applies to the next statement only |

**Important:** A CTE does not automatically make a query faster. Performance depends on the query, data, indexes, and execution plan.

## 12. Practical AML Examples

Assume a table named `Transactions` with columns `TransactionID`, `CustomerID`, and `TransactionAmount`.

### Find transactions greater than the average transaction amount

```sql
SELECT TransactionID, CustomerID, TransactionAmount
FROM Transactions
WHERE TransactionAmount > (
    SELECT AVG(TransactionAmount)
    FROM Transactions
);
```

### Find customers with transactions

Assume a `Customers` table with a `CustomerID` column.

```sql
SELECT c.CustomerID
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Transactions t
    WHERE t.CustomerID = c.CustomerID
);
```

These are learning examples only. Real AML alert rules require appropriate business requirements and validation.

## 13. Key Points to Remember

- A subquery is a query inside another query.
- `IN` checks whether a value matches a value in a result set.
- `EXISTS` checks whether at least one row exists.
- `NOT EXISTS` checks whether no matching row exists.
- `ANY` compares against at least one returned value.
- `ALL` compares against every returned value.
- A correlated subquery refers to the outer query.
- A CTE begins with `WITH`.
- Multiple CTEs can be separated by commas.
- A recursive CTE is useful for hierarchical data.
- Always test queries against your actual table and column names.
