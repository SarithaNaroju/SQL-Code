
--Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)



--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

--Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

--SELECT TOP (1000) [EmployeeID]
--      ,[FirstName]
--      ,[LastName]
--      ,[Age]
--      ,[Gender]
--  FROM [SQLTutorial].[dbo].[EmployeeDemographics]

Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Insert into EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

/*
Select Statement
Top, Distict, Count, Aa, Max, Min, Avg
*/

SELECT *
FROM EmployeeDemographics

SELECT FirstName
FROM EmployeeDemographics

SELECT FirstNAme, LastName As FullNAme
FROM EmployeeDemographics

SELECT TOP 5 *
FROM EmployeeDemographics

SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics

SELECT DISTINCT(Gender)
FROM EmployeeDemographics

SELECT COUNT(LastName)
FROM EmployeeDemographics

SELECT COUNT(LastName) As LastNameCount
FROM EmployeeDemographics

SELECT *
FROM EmployeeSalary

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT MIN(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

/*
Where Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'


SELECT *
FROM EmployeeDemographics
WHERE Age > 30

SELECT *
FROM EmployeeDemographics
WHERE Age >= 30

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'


SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%O%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NULL


SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL


Select * from EmployeeDemographics
SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age

Select * from EmployeeDemographics
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY Gender DESC

/*
Inner Joins, Full/Left/Right Outer Joins
*/

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
SELECT *
FROM SQLTutorial.dbo.EmployeeSalary


SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
Full Outer Join   SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
Left Outer Join   SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
Right Outer Join   SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary 
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	WHERE FirstName <> 'Michael'
	ORDER BY Salary DESC

SELECT JobTitle,, AVG(Salary) 
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle

/*
Union, Union ll
*/

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics

CREATE TABLE WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
Full Outer Join SQLTutorial.dbo.WarehouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WarehouseEmployeeDemographics.EmployeeID

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT *
FROM SQLTutorial.dbo.WarehouseEmployeeDemographics

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial.dbo.WarehouseEmployeeDemographics


SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT *
FROM SQLTutorial.dbo.WarehouseEmployeeDemographics
ORDER BY EmployeeID

/*
Case Statement
*/


SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS salaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary


/*
Having Clause
*/

SELECT JobTitle, Count(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/*
Updating or Deleting Data
*/

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

/*
Aliasing
*/

SELECT FirstName As Fname
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT FirstName + LastName As FullName
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT Avg(Age) As AvgAge
FROM SQLTutorial.dbo.EmployeeDemographics

--Aliasing Table Nme

SELECT Demo.EmployeeID, Sal.Salary
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.Salary

SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName,
  Sal.JobTitle, Ware.Age
FROM SQLTutorial.dbo.EmployeeDemographics Demo
LEFT JOIN SQLTutorial.dbo.EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN SQLTutorial.dbo.WarehouseEmployeeDemographics Ware
	ON Demo.EmployeeId = Ware.EmployeeID


/*
Partition By
*/

SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID

SELECT Gender, COUNT(Gender)
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender

/*
CTEs
*/

WITH CTE_Employee as
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)

Select *
FROM CTE_Employee


/*
Temp Tables
*/



Create table #temp_employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select * From #temp_employee


Insert into #temp_employee values (
'1001', 'HR', '45000'
)

Insert into #temp_employee 
SELECT * 
From SQLTutorial..EmployeeSalary

Select * From #temp_employee


Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee3

SELECT AvgAge * AvgSalary
from #temp_employee3

/*
String Functions
*/

/*

String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

---- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors 

	



---- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


---- Using Substring

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



---- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors


/*
Stored Procedures
*/

CREATE PROCEDURE TEST
AS
Select *
From Demo

EXEC TEST

CREATE PROCEDURE Temp_Employee1
AS
--DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee1 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee1
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee1
GO;


CREATE PROCEDURE Temp_Employee2 
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle --- make sure to change this in this script from original above
group by JobTitle

Select * 
From #temp_employee3
GO;


exec Temp_Employee2 @jobtitle = 'Salesman'
exec Temp_Employee2 @jobtitle = 'Accountant'



--/*
--Subqueries (in the Select, From, and Where Statement)
--*/


Select *
From EmployeeSalary

Select EmployeeID, JobTitle, Salary
From EmployeeSalary

-- Subquery in Select

Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

-- How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

-- Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID


-- Subquery in From

Select a.EmployeeID, AllAvgSalary
From 
	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmployeeID


-- Subquery in Where


Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID 
	From EmployeeDemographics
	where Age > 30)

