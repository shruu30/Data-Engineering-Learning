# Week 3 - Aggregate Functions, GROUP BY, HAVING & CASE WHEN

## What are Aggregate Functions?

Aggregate functions perform calculations on multiple rows and return a single value.

---

## 1. COUNT()

Counts the number of rows.

Syntax:

SELECT COUNT(*) FROM Employee;

Example:

SELECT COUNT(*) AS TotalEmployees
FROM Employee;

Use Cases:
- Total number of employees
- Total transactions
- Total customers

---

## 2. SUM()

Returns the total of a numeric column.

Syntax:

SELECT SUM(Salary)
FROM Employee;

Example:

SELECT SUM(Salary) AS TotalSalary
FROM Employee;

Use Cases:
- Total salary
- Total sales
- Total transaction amount

---

## 3. AVG()

Returns the average value.

Syntax:

SELECT AVG(Salary)
FROM Employee;

Example:

SELECT AVG(Salary) AS AverageSalary
FROM Employee;

Use Cases:
- Average salary
- Average account balance
- Average transaction value

---

## 4. MIN()

Returns the smallest value.

Example:

SELECT MIN(Salary)
FROM Employee;

Use Cases:
- Lowest salary
- Minimum balance
- Earliest transaction date

---

## 5. MAX()

Returns the largest value.

Example:

SELECT MAX(Salary)
FROM Employee;

Use Cases:
- Highest salary
- Largest transaction
- Latest transaction date

---

# GROUP BY

GROUP BY groups rows having the same value.

Syntax:

SELECT DepartmentID,
COUNT(*)
FROM Employee
GROUP BY DepartmentID;

Use Cases:
- Employees per department
- Customers per city
- Transactions per branch

---

# HAVING

HAVING filters grouped data.

Difference:

WHERE → Filters rows before grouping.

HAVING → Filters groups after GROUP BY.

Example:

SELECT DepartmentID,
COUNT(*)
FROM Employee
GROUP BY DepartmentID
HAVING COUNT(*) > 2;

---

# CASE WHEN

CASE works like IF-ELSE.

Syntax:

SELECT EmployeeName,
CASE
WHEN Salary >= 70000 THEN 'High'
WHEN Salary >= 50000 THEN 'Medium'
ELSE 'Low'
END AS SalaryCategory
FROM Employee;

Use Cases:
- Salary Classification
- Transaction Risk Level
- Customer Category



# SQL Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY





