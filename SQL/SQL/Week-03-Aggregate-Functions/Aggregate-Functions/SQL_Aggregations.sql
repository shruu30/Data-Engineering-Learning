

/******************************************************************************************
 STEP 1 : Create Employee Table
******************************************************************************************/

CREATE TABLE Employee
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    City VARCHAR(50)
);

/******************************************************************************************
 STEP 2 : Insert Sample Data
******************************************************************************************/

INSERT INTO Employee
VALUES
(101,'Amit',1,60000,'Mumbai'),
(102,'Priya',2,45000,'Pune'),
(103,'Rahul',1,75000,'Delhi'),
(104,'Sneha',3,52000,'Pune'),
(105,'Karan',2,40000,'Mumbai'),
(106,'Neha',1,85000,'Delhi');

/******************************************************************************************
 STEP 3 : COUNT()
******************************************************************************************/

SELECT COUNT(*) AS TotalEmployees
FROM Employee;

/******************************************************************************************
 STEP 4 : SUM()
******************************************************************************************/

SELECT SUM(Salary) AS TotalSalary
FROM Employee;

/******************************************************************************************
 STEP 5 : AVG()
******************************************************************************************/

SELECT AVG(Salary) AS AverageSalary
FROM Employee;

/******************************************************************************************
 STEP 6 : MIN()
******************************************************************************************/

SELECT MIN(Salary) AS MinimumSalary
FROM Employee;

/******************************************************************************************
 STEP 7 : MAX()
******************************************************************************************/

SELECT MAX(Salary) AS MaximumSalary
FROM Employee;

/******************************************************************************************
 STEP 8 : GROUP BY - Count Employees in Each Department
******************************************************************************************/

SELECT
    DepartmentID,
    COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DepartmentID;

/******************************************************************************************
 STEP 9 : GROUP BY - Total Salary by Department
******************************************************************************************/

SELECT
    DepartmentID,
    SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY DepartmentID;

/******************************************************************************************
 STEP 10 : GROUP BY - Average Salary by City
******************************************************************************************/

SELECT
    City,
    AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY City;

/******************************************************************************************
 STEP 11 : HAVING - Departments with More Than 1 Employee
******************************************************************************************/

SELECT
    DepartmentID,
    COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DepartmentID
HAVING COUNT(*) > 1;

/******************************************************************************************
 STEP 12 : HAVING - Departments with Average Salary Greater Than 50000
******************************************************************************************/

SELECT
    DepartmentID,
    AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;

/******************************************************************************************
 STEP 13 : CASE WHEN - Salary Category
******************************************************************************************/

SELECT
    EmployeeName,
    Salary,
    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employee;

/******************************************************************************************
 STEP 14 : CASE WHEN with GROUP BY
 Count Employees by Salary Category
******************************************************************************************/

SELECT
    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory,
    COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY
    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END;

/******************************************************************************************
 STEP 15 : ORDER BY with GROUP BY
******************************************************************************************/

SELECT
    DepartmentID,
    SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY DepartmentID
ORDER BY TotalSalary DESC;


