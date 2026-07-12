# Week 1 - SQL Basics Notes

## Topics Covered

### 1. What is SQL?
SQL (Structured Query Language) is used to:
- Create databases and tables
- Insert, update, and delete data
- Retrieve data from databases
- Manage database objects

---

### 2. Types of SQL Commands

#### DDL (Data Definition Language)
- CREATE
- ALTER
- DROP
- TRUNCATE

#### DML (Data Manipulation Language)
- INSERT
- UPDATE
- DELETE

#### DQL (Data Query Language)
- SELECT

#### DCL (Data Control Language)
- GRANT
- REVOKE

#### TCL (Transaction Control Language)
- COMMIT
- ROLLBACK
- SAVEPOINT

---

### 3. SELECT
Used to retrieve data from a table.

Example:
SELECT * FROM Employee;

---

### 4. WHERE
Used to filter records.

Example:
SELECT * FROM Employee
WHERE Salary > 50000;

---

### 5. ORDER BY
Sorts records in ascending or descending order.

Example:
ORDER BY Salary DESC;

---

### 6. DISTINCT
Removes duplicate values.

Example:
SELECT DISTINCT City FROM Employee;

---

### 7. TOP / LIMIT
Returns a fixed number of records.

Example (SQL Server):
SELECT TOP 5 * FROM Employee;

---

### 8. Alias
Used to give a temporary name to a column.

Example:
SELECT EmployeeName AS Name
FROM Employee;

---

## What I Learned
- SQL command categories
- Basic SELECT queries
- Filtering data
- Sorting data
- Removing duplicate records
- Using aliases

