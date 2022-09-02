create database FIS

use FIS

create table tblDept(
Deptid int primary key,
DeptName varchar(20)not null,
DeptLocation nvarchar(30)
)
create table tblEmp(
Empid int primary key,
EmpName varchar(30),
Gender char(7),
Salary float,
Deptid int references tblDept(Deptid)
)


sp_help tblDept
sp_help tblEmp

select * from tblDept
select * from tblEmp

insert into tblDept(Deptid,DeptName) values(1,'IT')
insert into tblDept values(2,'HR',null)
insert into tblDept values(5,null,'Pune')

insert into tblDept values(3,'sale','Mumbai'),(4,'admin','Chennai')

insert into tblEmp values(100,'Vaishali','Female',65000,null)
insert into tblEmp values(101,'Anjali','Female',65100,2),(102,'Raj','Male',65400,1),(103,'Ashwini','Female',64900,1)

--altering table and adding a column
alter table tblEmp
add Phone varchar(15)

update tblEmp set Phone='3333333'where Empid=102

--alter table and add constraint
alter table tblEmp
add Constraint unqphone unique(Phone)

insert into tblEmp values(104,'Saurabh','Male',63000,2,'4444444')
insert into tblEmp values(105,'Nikhil','Male',61000,3,'5555555')

--check constraint
alter table tblEmp
add constraint salarychk check(Salary>=25000)


update tblDept set DeptLocation='pune' where Deptid=1
update tblDept set DeptLocation='noida' where DeptName='HR'
update tblEmp set DeptId=2 where Empid=102
update tblEmp  set phone='123456789' where Empid=103


--defult constraint
alter table tblDept
add constraint deflocation default 'Hyderabad' for deptLocation

insert into tblDept (Deptid,deptName)values(5,'Operations')

--Enabling or disabling a constraint
alter table tblemp
nocheck constraint salarychk --disable

alter table tblemp
check constraint salarychk --enable

--dropping a column from a table
alter table tblEmp
add Email varchar(30)

alter table tblEmp
drop column Email

--truncate table
create table dummytable
(
dummyid int identity(1,2),
dummyname varchar(20),
dummycity varchar(10)
)

select * from dummytable

insert into dummytable values('vvvvv','ddddd'),('abcd','xyz'),('aaaaa','ssssss')

truncate table dummytable

drop table dummytable

delete from dummytable where dummyid=5

--setting the implicit transaction off
set implicit_transactions off

begin transaction
select* from dummytable
delete from dummytable
select * from dummytable
commit

select * from dummytable

--column level or table level constraint
/*column level
create table orders
(orderid int primary key,
orderdate date not null,
Customerid int foreign kry references Customers(custid)


table level

create table orders(
orderid int,
orderdate datetime,
customerid int 
primary key(orderid),
constraint fkconst foreign key(customerid)references Customers(custid),
constraint ordamtchk check(orderamount>500)
)
*/


--selection and projection
select empid,empName,Salary from tblEmp
where Deptid=3


--alias names to columns
select empid as EmployeeId,empName EmployeeName,salary 'Employee Salary'
from tblEmp

--top few records
select top 3* from tblEmp

--top percentage of records
select top 2 percent*from tblEmp


--Relational operators
select *from tblEmp where salary<>65500
select *from tblEmp where salary<65000

select *from tblEmp where salary>=65100 and salary<=65500

--between operator 
select *from tblEmp where salary between 65100 and 65500

--negative operators
select *from tblEmp where salary not  between 65100 and 65500

--null values 
select * from tblEmp where Deptid is null
select * from tblEmp where Deptid is not null

--logical operator (or)
select * from tblEmp where Deptid =2 or Deptid=3

--in operator
select * from tblEmp where Deptid in(2,3)
select * from tblEmp where Deptid not in(2,3)

--Arithmetic Operator
select empname, deptid,salary,salary+1000 as 'new salary' from tblEmp
select empname,salary,salary*12 as'Annual Salary' from tblEmp
update tblEmp set salary=(salary+200) where salary<65000

--Aggregate Functions
select avg(salary)as 'Average Salary'from tblEmp
select sum(salary)'Sum of Salary'from tblEmp
select min(salary)'Minimum Salary'from tblEmp
select max(salary)'Maximum Salary'from tblEmp




