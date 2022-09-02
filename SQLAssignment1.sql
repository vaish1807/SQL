create database demo

use demo


--create table Client

create table Clients(
Client_Id int primary key,
Cname varchar(40) not null,
Address varchar(30),
Email varchar(30) unique,
Phone  numeric(10),
Business varchar(20)not null
);

--insert into client table 

insert into Clients (Client_Id,Cname,Address,Email,Phone,Business) values(1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing'),
(1002,'Trackon Consultant','Mumbai','consult@trackon.com',8734210090,'Consultant'),
(1003,'MoneySaver Distributors','kolkata','save@moneysaver.com',7799886655,'Reseller'),
(1004,'Lawful Corp', 'Chennai','justice@lawful.com',9210342219,'Professional')

select * from Clients

--create table department

create table Departments(
Deptno int  primary key,
Dname varchar(15) not null,
Loc varchar(20)
)


--Insert into Department 

insert into Departments(Deptno,Dname,Loc) values(10,'Design','Pune'),(20,'Developement','Pune'),(30,'Testing','Mumbai'),(40,'Document','Mumbai')

select * from Departments


--create table Employees

create table Employees(
Empno int primary key,
Ename varchar(20) not null,
Job varchar(15),
Salary numeric(7)check (Salary>0),
Deptno int references Departments(Deptno)
)


select * from Employees

--insert into table Employees

insert into Employees(Empno,Ename,Job,Salary,Deptno)values(7001,'Sandeep','Analyst',25000,10),(7002,'Rajesh','Designer',30000,10)
insert into Employees(Empno,Ename,Job,Salary,Deptno)values(7003,'Madhav','Developer',40000,20),(7004,'Manoj','Developer',40000,20)
insert into Employees(Empno,Ename,Job,Salary,Deptno)values(7005,'Abhay','Designer',35000,10),(7006,'Uma','Tester',30000,30)
insert into Employees(Empno,Ename,Job,Salary,Deptno)values(7007,'Gita','Tech. Writer',30000,40),(7008,'Priya','Tester',35000,30)
insert into Employees(Empno,Ename,Job,Salary,Deptno)values(7009,'Nutan','Developer',45000,20),(7010,'Smita','Analyst',20000,10),(7011,'Anand','Project Mgr',65000,10)

--Create table Projects
create table Projects(
Project_Id int primary key,
Descr varchar(30) not null,
Start_Date date,
Planned_End_Date date,
Actual_End_Date date,
Budget numeric(10)check (Budget>0),
Client_ID int references clients (Client_Id)
)

--insert into Projects

insert into Projects(Project_Id,Descr,Start_Date,Planned_End_Date,Actual_End_Date,Budget,Client_ID) values (401,'Inventory',CONVERT(datetime,'01-APR-2011'),CONVERT(datetime,'01-OCT-2011'),convert(datetime,'31-OCT-2011'),150000,1001)
insert into Projects(Project_Id,Descr,Start_Date,Planned_End_Date,Budget,Client_ID) values (402,'Accounting',CONVERT(datetime,'01-AUG-2011'),CONVERT(datetime,'01-JAN-2012'),500000,1002)
insert into Projects(Project_Id,Descr,Start_Date,Planned_End_Date,Budget,Client_ID) values (403,'Payroll',CONVERT(datetime,'01-OCT-2011'),CONVERT(datetime,'31-DEC-2011'),75000,1003)
insert into Projects(Project_Id,Descr,Start_Date,Planned_End_Date,Budget,Client_ID) values (404,'Contact Mgmt',CONVERT(datetime,'01-NOV-2011'),CONVERT(datetime,'31-DEC-2011'),50000,1004)


-- create table EmpProjectTasks 


create table EmpProjectTasks(
Project_ID int references Projects(Project_Id),
Empno int  references Employees(Empno),
Start_Date date,
End_Date date,
Task varchar(25) not null,
Status varchar(15)not null,
primary key(project_Id,Empno)
)

--insert into EmpProjectTasks 

insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,End_date,Task,Status) values (401,7001,CONVERT(datetime,'01-APR-2011'),convert(datetime,'20-APR-2011'),'System Analysis','Completed')
insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,End_date,Task,Status) values (401,7002,CONVERT(datetime,'21-APR-2011'),convert(datetime,'30-MAY-2011'),'System Design','Completed')
insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,End_date,Task,Status) values (401,7003,CONVERT(datetime,'01-JUN-2011'),convert(datetime,'15-JUL-2011'),'Coding','Completed'),
(401,7004,CONVERT(datetime,'18-JUL-2011'),convert(datetime,'01-SEP-2011'),'Coding','Completed'),(401,7006,CONVERT(datetime,'03-SEP-2011'),convert(datetime,'15-SEP-2011'),'Testing','Completed'),
(401,7009,CONVERT(datetime,'18-SEP-2011'),convert(datetime,'05-OCT-2011'),'Code Change','Completed'),(401,7008,CONVERT(datetime,'06-OCT-2011'),convert(datetime,'16-OCT-2011'),'Testing','Completed'),
(401,7007,CONVERT(datetime,'06-OCT-2011'),convert(datetime,'22-OCT-2011'),'Documentation','Completed'),(401,7011,CONVERT(datetime,'22-OCT-2011'),convert(datetime,'31-OCT-2011'),'Sign Off','Completed'),
(402,7010,CONVERT(datetime,'01-AUG-2011'),convert(datetime,'20-AUG-2011'),'System Analysis','Completed'),(402,7002,CONVERT(datetime,'22-AUG-2011'),convert(datetime,'30-SEP-2011'),'System Design','Completed')
insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,Task,Status) values(402,7004,CONVERT(datetime,'01-OCT-2011'),'Coding','In Progress')




select * from Clients
select * from Departments
select * from Employees
select * from Projects
select * from EmpProjectTasks
