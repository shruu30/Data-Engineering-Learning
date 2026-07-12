# SQL Basics

-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert Department Data
INSERT INTO Department VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    City VARCHAR(50)
);

-- Insert Employee Data
INSERT INTO Employee VALUES
(101,'Amit',1,60000,'Mumbai'),
(102,'Priya',2,45000,'Pune'),
(103,'Rahul',1,75000,'Delhi'),
(104,'Sneha',3,52000,'Pune'),
(105,'Karan',2,40000,'Mumbai'),
(106,'Neha',1,85000,'Delhi');
