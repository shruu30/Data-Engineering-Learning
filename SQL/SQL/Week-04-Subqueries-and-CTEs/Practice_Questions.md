# Week 4 - Practice Questions: Subqueries and CTEs

## Part A: Subqueries

### Q1. Average Salary
Write a query to find employees earning more than the average salary of all employees.

### Q2. Highest Salary
Write a query using a subquery to find the employee or employees with the highest salary.

### Q3. Department Filtering
Write a query to find employees who work in the IT department using a subquery.

### Q4. Departments Without Employees
Write a query to find departments that do not have any employees using `NOT EXISTS`.

### Q5. EXISTS Operator
Write a query to find departments that have at least one employee using `EXISTS`.

### Q6. ANY Operator
Write a query to find employees whose salary is greater than at least one employee's salary in DepartmentID 2.

### Q7. ALL Operator
Write a query to find employees whose salary is greater than every employee's salary in DepartmentID 2.

### Q8. Correlated Subquery
Write a query to find employees earning more than the average salary in their own department.

## Part B: Common Table Expressions (CTEs)

### Q9. Basic CTE
Use a CTE to find employees earning more than ₹50,000.

### Q10. Department Employee Count
Use a CTE to count employees in each department.

### Q11. Multiple CTEs
Use two CTEs to find departments that have more than five employees.

### Q12. Top Salary
Use a CTE to find the employee or employees with the second-highest distinct salary.

## Part C: AML Practice

Assume a `Transactions` table with columns `TransactionID`, `CustomerID`, and `TransactionAmount`.

### Q13. High-Value Transactions
Write a subquery to find transactions whose amount is greater than the average transaction amount.

### Q14. Customers Without Transactions
Assume a `Customers` table with a `CustomerID` column. Use `NOT EXISTS` to find customers who have no transactions.

### Q15. Transaction Summary
Use a CTE to calculate the total transaction amount for each customer.

## Part D: Interview Questions

### Q16. What is a subquery?

### Q17. What is the difference between a single-row and a multiple-row subquery?

### Q18. What is a correlated subquery?

### Q19. What is the difference between `IN` and `EXISTS`?

### Q20. What is a CTE, and why is it used?

### Q21. What is the difference between a CTE and a subquery?

### Q22. Can we use multiple CTEs in a single SQL statement?

### Q23. What is a recursive CTE? Give one practical use case.

### Q24. Does using a CTE always improve query performance? Explain.

---

## Instructions

- Solve the questions using SQL Server.
- Save your solutions in `Practice_Answers.sql`.
- Test queries against tables that contain the required columns.
- Use meaningful aliases and format SQL code neatly.
- For AML examples, treat the results as learning exercises, not production alert rules.
