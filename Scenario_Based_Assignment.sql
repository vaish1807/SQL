create database scenario_assignment

use scenario_assignment

--1.BOOK
create table book(
id int primary key,
title varchar(20),
author varchar(30),
isbn numeric(12) unique,
published_date datetime 
)

insert into book values (1,'My First SQL Book','Mary Parker','981483029127','2012-02-22 12:08:17')
insert into book values(2,'My Second SQL Book','John Mayer','857300923713','1972-07-03 09:22:45')
insert into book values(3,'My Third SQL Book','Cary Flient','523120967812','2015-10-18 14:05:44')

select * from book

select* from book where author like '%er'

--2. Reviews

create table reviews(
id int  primary key,
book_id int foreign key references book(id),
reviewer_name varchar(30),
content varchar(20),
rating int,
published_date datetime 
)

insert into reviews values(1,1,'John Smith','My First Review',4,'2017-12-10 05:50:11')
insert into reviews values(2,2,'John Smith','My Second Review',5,'2017-10-13 15:05:12')
insert into reviews values(3,2,'Alice Walker','Another Review',1,'2017-10-22 23:47:10')

select * from reviews

select title, author,reviewer_name from book  join reviews on book.id=reviews.id 

--3. Display the reviewer name who reviewed more than one book
 select reviewer_name from reviews group by reviewer_name having count(reviewer_name)>1 

 --4.Customet table
 create table customer(
 id int primary key,
 name varchar(40),
 age int,
 address varchar(30),
 salary int
 )

  insert into customer values(1,'Ramesh',32,'Ahmedabad',2000)
 insert into customer values(2,'Khilan',25,'Delhi',1500)
 insert into customer values(3,'Kaushik',23,'Kota',2000)
 insert into customer values(4,'Chaitali',25,'Mumbai',6500)
 insert into customer values(5,'Hardik',27,'Bhopal',8500)
 insert into customer values(6,'Komal',22,'MP',4500)
 insert into customer values(7,'Muffy',24,'Indore',10000)

 select * from customer

 select name from customer where address like '%o%'

  --5 
 create table orders(
 oid int primary key,
 date datetime,
 customer_id int foreign key references customer(id),
 amount int
 )
  insert into orders values(102,'2009-10-08 00:00:00',3,3000)
  insert into orders values(100,'2009-10-08 00:00:00',3,1500)
  insert into orders values(101,'2009-11-20 00:00:00',2,1560)
  insert into orders values(103,'2008-05-20 00:00:00',4,2060)

  select * from orders

  select count(*) 'Total no of customer placed order on same date',date 'order date' from customer c1 join orders o1 on c1.id=o1.customer_id 
  group by date having count(*)>1

   --6 Employee
   create table Employee(
 id int primary key,
 name varchar(40),
 age int,
 address varchar(30),
 salary int
 )

 insert into Employee values(1,'Ramesh',32,'Ahmedabad',2000)
 insert into Employee values(2,'Khilan',25,'Delhi',1500)
 insert into Employee values(3,'Kaushik',23,'Kota',2000)
 insert into Employee values(4,'Chaitali',25,'Mumbai',6500)
 insert into Employee values(5,'Hardik',27,'Bhopal',8500)
 insert into Employee(id,name,age,address) values(6,'Komal',22,'MP')
 insert into Employee (id,name,age,address) values(7,'Muffy',24,'Indore')

 select * from Employee

 select name from Employee where salary is null

  --7 Studentdetails

 create table studentdetails(
 id int primary key,
 registerNo int,
 name varchar(30),
 age int,
 qualification varchar(10),
 mobileno numeric(10),
 mail_Id varchar(20),
 location varchar(30),
 gender char
 )

 insert into studentdetails values(1,2,'Sai',22,'B.E','9952836777','Sai@gmail.com','Chennai','M')
 insert into studentdetails values(2,3,'Kumar',20,'BSC','7890125648','Kumar@gmail.com','Madurai','M')
 insert into studentdetails values(3,4,'Selvi',22,'B.Tech','8904567342','selvi@gmail.com','selam','F')
 insert into studentdetails values(4,5,'Nisha',25,'M.E','7834672310','Nisha@gmail.com','Theni','F')
 insert into studentdetails values(5,6,'SaiSaran',21,'B.A','7890345678','saran@gmail.com','Madurai','F')
 insert into studentdetails values(6,7,'Tom',23,'BCA','8901234675','Tom@gamil.com','Pune','M')

  select * from studentdetails

 select gender,count(*) 'Gender Count' from studentdetails group by gender

  --8 coursedetails  and courseRegistration
 create table Coursedetails(
c_id varchar(10) primary key,
c_name varchar(30),
start_date date,
end_date date,
fee int
)

insert into Coursedetails values('DN003','DotNet','2018-02-01','2018-02-28',15000)
insert into Coursedetails values('DV004','DataVisualization','2018-03-01','2018-04-15',15000)
insert into Coursedetails values('JA002','AdvancedJava','2018-01-02','2018-01-12',10000)
insert into Coursedetails values('JC001','CoreJava','2018-01-02','2018-01-12',3000)

select * from Coursedetails

create table courseRegistration(
RegisterNo int,
Cid varchar(10) foreign key references Coursedetails(c_id),
Batch varchar(20)
)

insert into courseRegistration values(2,'DN003','FN')
insert into courseRegistration values(3,'DV004','AN')
insert into courseRegistration values(4,'JA002','FN')
insert into courseRegistration values(2,'JA002','AN')
insert into courseRegistration values(5,'JC001','FN')

select * from courseRegistration

select c_name 'Course name',( select count(*)from  courseRegistration where Cid=c.c_id)'No of Student Registred' from Coursedetails c
where start_date>'2018-01-02' and end_date<= '2018-02-28'

--9.customer and order 

create table customer1(
customer_id int primary key,
first_name varchar(50),
last_name varchar(50)
)

insert into customer1 values (1,'George','Washington'),(2,'John','Adams'),(3,'Thomas','Jefferson'),(4,'James','Madison'),(5,'James','Monroe')

select * from customer1

create table ord(
order_id int primary key ,
order_date date,
amount varchar(50),
customer_id int 
)

insert into ord values (1,'1776-07-04','$234.56',1)
insert into ord  values (2,'1760-03-14','$78.50',3)
insert into ord values (3,'1784-05-23','$124.00',2)
insert into ord values (4,'1790-03-09','$65.50',3)
insert into ord values (5,'1795-07-21','$25.50',10)
insert into ord values (6,'1787-11-27','$14.40',9)

select * from ord

select * from customer1 c where (select count(*) from ord where customer_id= c.customer_id)=2

--10 StudentDetails

select reverse(name),upper(location) from studentdetails 

select  name,upper(location) from studentdetails  order by name desc

--11 View

create table order2(
Id int primary key,
Orderdate date,
OrderNumber int,
CustomerId int,
TotalAmount int)

create table orderitem(
Id int primary key,
OrderId int,
ProductId int,
UnitPrice int,
Quantity int)

create table Product(
Id int primary key,
ProductName varchar(50),
SupplierId int,
UnitPrice int,
Package varchar(10),
IsDiscontinued char(1)
)

create view vwTable
as
select productname ,Quantity,ordernumber from order2 o join orderitem oi on o.id=oi.id join Product p on oi.ProductId=p.Id
select * from vwtable 

select * from order2
select * from orderitem
select * from product

--12 Display course name registered by student nisha 
 
 select c_name from Coursedetails cd
 inner join courseRegistration cr on cd.c_id=cr.Cid
 inner join studentdetails sd on cr.RegisterNo =sd.registerNo	
  where name='nisha'