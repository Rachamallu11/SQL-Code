use learning;



Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
);

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

Select * from EmployeeSalary;

Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
);

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');
-- subquries  ----------

-- subquery in "select" ----

select EmployeeID, Salary, (select avg(salary) from EmployeeSalary) as AvgSalAll from EmployeeSalary;

-- subquery in how to do with partition by --------

select EmployeeID, Salary , avg(salary) over () as AvgSalAl from EmployeeSalary;

-- subquery in "from" -----------

select a.EmployeeID, AvgSalAl
        from (select EmployeeID, Salary , avg(salary) over () as AvgSalAl from EmployeeSalary) a ;
-- in the from query we have taken the two columns from them and print at the o/p  ----- 

-- subquery in "where" ----

-- in the EmployeeSalary table we don't have the age column but we want the o/p who has greater than the 30 so here we can use joins or subquery

select EmployeeID, JobTitle, Salary 
from EmployeeSalary 
where EmployeeID in (select EmployeeID from EmployeeDemographics where Age>30)


