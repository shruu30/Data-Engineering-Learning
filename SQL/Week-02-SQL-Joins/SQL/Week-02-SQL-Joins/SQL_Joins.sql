--Topic - SQL Joins
 --STEP 1 : Create Department Table

(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- STEP 2 : Insert Sample Data into Department Table

INSERT INTO Department
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing');

 --STEP 3 : Create Employee Table

CREATE TABLE Employee
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    City VARCHAR(50)
);


-- STEP 4 : Insert Sample Data into Employee Table

INSERT INTO Employee
VALUES
(101,'Amit',1,60000,'Mumbai'),
(102,'Priya',2,45000,'Pune'),
(103,'Rahul',1,75000,'Delhi'),
(104,'Sneha',3,52000,'Pune'),
(105,'Karan',NULL,40000,'Mumbai'),
(106,'Neha',1,85000,'Delhi');

 --STEP 5 : View Data

SELECT * FROM Employee;

SELECT * FROM Department;

-- STEP 6 : INNER JOIN
-- Returns only the matching records from both tables.

SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.City
FROM Employee AS e
INNER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --STEP 7 : LEFT JOIN
 --Returns all records from the Employee table and matching records from Department.

SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.City
FROM Employee AS e
LEFT JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --STEP 8 : RIGHT JOIN
 --Returns all records from the Department table and matching records from Employee.

SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.City
FROM Employee AS e
RIGHT JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --STEP 9 : FULL OUTER JOIN 
 --Returns all matching and non-matching records from both tables.

SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.City
FROM Employee AS e
FULL OUTER JOIN Department AS d
ON e.DepartmentID = d.DepartmentID;

 --STEP 10 : CROSS JOIN
-- Returns every possible combination of Employee and Department records.

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employee AS e
CROSS JOIN Department AS d;

