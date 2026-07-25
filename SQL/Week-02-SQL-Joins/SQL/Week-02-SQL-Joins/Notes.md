 SQL Joins Notes

## What is a JOIN?

A JOIN is used to combine rows from two or more tables based on a related column.

## Types of JOIN

### 1. INNER JOIN
Returns only the matching records from both tables.

Syntax:
SELECT *
FROM Employee e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID;

### 2. LEFT JOIN
Returns all records from the left table and matching records from the right table.
If there is no match, NULL values are returned.

Syntax:
SELECT *
FROM Employee e
LEFT JOIN Department d
ON e.DepartmentID = d.DepartmentID;

### 3. RIGHT JOIN
Returns all records from the right table and matching records from the left table.

Syntax:
SELECT *
FROM Employee e
RIGHT JOIN Department d
ON e.DepartmentID = d.DepartmentID;

### 4. FULL OUTER JOIN
Returns all matching and non-matching records from both tables.

### 5. CROSS JOIN
Returns every possible combination of rows from both tables.





