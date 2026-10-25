# Week 4 - SQL Interview Notes: Subqueries and CTEs

## 1. What is a subquery?

A subquery is a SQL query written inside another SQL query. It helps retrieve data that the outer query uses for filtering or calculations.

## 2. What are the types of subqueries?

Common types include:
- Single-row subquery
- Multiple-row subquery
- Correlated subquery
- Scalar subquery

## 3. What is a single-row subquery?

A single-row subquery returns one row. For example, finding employees whose salary is greater than the average salary.

## 4. What is a multiple-row subquery?

A multiple-row subquery returns multiple rows. Operators such as `IN`, `ANY`, and `ALL` can be used with suitable subqueries.

## 5. What is a correlated subquery?

A correlated subquery refers to a column from the outer query. Its result depends on the current outer row.

## 6. What is the difference between IN and EXISTS?

- `IN` checks whether a value matches a value in a list or subquery result.
- `EXISTS` checks whether a subquery returns at least one row.

Both can be used to solve similar problems. Performance depends on the query, data, indexes, and execution plan.

## 7. What is NOT EXISTS?

`NOT EXISTS` checks whether the subquery returns no matching rows. It is useful for finding records without a related record.

Example: Customers who have no transactions.

## 8. What are ANY and ALL?

- `ANY`: The comparison must be true for at least one value returned by the subquery.
- `ALL`: The comparison must be true for every value returned by the subquery.

Example: `Salary > ALL (subquery)` means the salary must be greater than every returned salary.

## 9. What is a CTE?

CTE stands for Common Table Expression. It is a named result set defined using the `WITH` keyword and used by the SQL statement immediately following it in SQL Server.

## 10. What is the syntax of a CTE?

```sql
WITH CTE_Name AS (
    SELECT column_name
    FROM table_name
)
SELECT *
FROM CTE_Name;
```

## 11. Why do we use CTEs?

CTEs help make complex queries easier to read, organize, and maintain. They can also support recursive queries.

## 12. Can we use multiple CTEs?

Yes. In SQL Server, multiple CTEs can be defined in one `WITH` clause and separated by commas.

```sql
WITH CTE1 AS (
    SELECT DepartmentID, COUNT(*) AS EmployeeCount
    FROM Employee
    GROUP BY DepartmentID
),
CTE2 AS (
    SELECT DepartmentID, EmployeeCount
    FROM CTE1
    WHERE EmployeeCount > 5
)
SELECT *
FROM CTE2;
```

## 13. What is the difference between a CTE and a subquery?

A subquery is nested inside another query. A CTE is defined separately using `WITH`, which can improve readability when a query has several steps.

A CTE does not automatically improve performance.

## 14. What is a recursive CTE?

A recursive CTE refers to itself. It is useful for hierarchical data such as employee-manager relationships or organizational structures.

It typically contains:
- Anchor member: establishes the starting rows.
- Recursive member: retrieves the next level of rows.

## 15. What is a scalar subquery?

A scalar subquery returns a single value, usually one row and one column. It can be used in expressions or comparisons where a single value is expected.

## 16. What happens if a scalar subquery returns multiple rows?

In SQL Server, a scalar subquery used in a single-value comparison causes an error if it returns more than one value.

## 17. Can a CTE be used multiple times?

A CTE can be referenced multiple times within the single statement immediately following its definition. It is not automatically stored as a permanent table.

## 18. What is the difference between a CTE and a temporary table?

- CTE: Defined for one following statement.
- Temporary table: Stored temporarily in SQL Server's `tempdb` and can be used across multiple statements while it exists.

Temporary tables can also be indexed, depending on the requirements.

## 19. How are subqueries useful in AML?

Subqueries can help compare transaction amounts with averages, identify customers with no transactions, or filter records based on related data.

Real AML rules must follow approved business requirements and validation.

## 20. Interview revision checklist

- [ ] Explain subqueries with an example.
- [ ] Explain correlated subqueries.
- [ ] Differentiate `IN` and `EXISTS`.
- [ ] Explain `ANY` and `ALL`.
- [ ] Write a basic CTE.
- [ ] Write multiple CTEs.
- [ ] Explain recursive CTEs.
- [ ] Compare CTEs, subqueries, and temporary tables.
- [ ] Explain one AML-related SQL example.
