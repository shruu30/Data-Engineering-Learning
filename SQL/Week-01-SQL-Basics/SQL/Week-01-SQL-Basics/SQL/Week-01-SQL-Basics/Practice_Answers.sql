
#SQL Practice Answers

-- Question 1
-- Display all employees.

SELECT *
FROM Employee;

------------------------------------------------

-- Question 2
-- Display EmployeeName and Salary.

SELECT EmployeeName, Salary
FROM Employee;

------------------------------------------------

-- Question 3
-- Display employees whose salary is greater than 50000.

SELECT *
FROM Employee
WHERE Salary > 50000;

------------------------------------------------

-- Question 4
-- Display employees from Pune.

SELECT *
FROM Employee
WHERE City = 'Pune';

------------------------------------------------

-- Question 5
-- Display employees from Pune whose salary is greater than 45000.

SELECT *
FROM Employee
WHERE City = 'Pune'
AND Salary > 45000;
