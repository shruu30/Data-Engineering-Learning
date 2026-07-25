--Practice_Answers.sql

 --Question 1
-- Display Employee Name and Department Name.

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employee AS e
INNER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

-- Question 2
 --Display all employees along with their department names.

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employee AS e
LEFT JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --Question 3
 --Display all departments, even if no employees belong to them.


SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employee AS e
RIGHT JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --Question 4
 --Display every possible combination of employees and departments.

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employee AS e
CROSS JOIN Department AS d;

-- Question 5
 --Display only employees who belong to the IT department.

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employee AS e
INNER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

-- Question 6
-- Display employees whose salary is greater than 50000 along with their department names.

SELECT
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employee AS e
INNER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;

-- Question 7
-- Display Employee Name, Department Name, Salary and City.

SELECT
    e.EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.City
FROM Employee AS e
INNER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --Question 8
 --Count the number of employees in each department.
SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Department AS d
INNER JOIN Employee AS e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


 --Question 9
 --Display departments having more than one employee.

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Department AS d
INNER JOIN Employee AS e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 1;


-- Question 10
-- Find employees who are not assigned to any department.


SELECT
    e.EmployeeName,
    e.DepartmentID
FROM Employee AS e
LEFT JOIN Department AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

