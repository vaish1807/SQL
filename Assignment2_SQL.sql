create database sqlassignment2

use sqlassignment2

create table emp(
empno int primary key,
ename varchar(20),
job varchar(30),
mgrid int ,
hiredate date,
sal int,
comm int, 
deptno int 
)

select * from emp

insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7521,' WARD','SALESMAN',7698, '22-FEB-81',1250,500,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7566,'JONES','MANAGER',7839,'02-APR-81',2975,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal, deptno)values(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850, 30)
insert into emp(empno, ename, job, mgrid, hiredate, sal, deptno)values(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,10)
insert into emp(empno, ename, job, mgrid, hiredate, sal, deptno)values(7788 ,'SCOTT','ANALYST',7566 ,'19-APR-87',3000,20)
insert into emp(empno, ename, job, hiredate, sal, deptno)values(7839 ,'KING','PRESIDENT','17-NOV-81',5000,10)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7844,'TURNER','SALESMAN', 7698,'08-SEP-81',1500,0,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7876 ,'ADAMS','CLERK',7788,'23-MAY-87',1100,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7900 ,'JAMES','CLERK',7698,'03-DEC-81',950,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7902 , 'FORD', 'ANALYST', 7566,'03-DEC-81',3000,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7934 ,'MILLER','CLERK',7782,'23-JAN-82',1300,10)

alter table  emp
add foreign key (deptno) references dept(deptno)

create table DEPT(
deptno int primary key not null,
dname varchar(30), 
loc varchar(20)
)

insert into DEPT(deptno, dname, loc)values(10,'ACCOUNTING','NEW YORK')
insert into DEPT(deptno, dname, loc)values(20,'RESEARCH', 'DALLAS')
insert into DEPT(deptno, dname, loc)values(30,'SALES','CHICAGO')
insert into DEPT(deptno, dname, loc)values(40,'OPERATIONS',' BOSTON')

select * from DEPT

select * from DEPT cross join EMP

--self join
--list all emp name along with their managers
select e1.ename as 'Employee Name',m1.ename as 'Manager Name'
from emp e1 inner join emp m1 on e1.mgrid=m1.empno

--left outer joins
select * from Emp left outer join DEPT on emp.deptno=dept.deptno

select * from Emp right outer join DEPT on emp.deptno=dept.deptno

--find all managers who have more than 2 emp reporting to them
--method 1
select mgrid,count (empno)from emp group by mgrid
having count (empno)>2

--method 2
select mgr.ename 'Manager Name',count (e.empno)'No Of Employees'
from emp e left join emp mgr on e.mgrid=mgr.empno
group by e.mgrid,mgr.ename
having count (e.empno)>2

--SET - I

--1. List all employees whose name begins with 'A'. 
select * from emp where ename Like 'A%'

--2. Select all those employees who don't have a manager. 
Select ename from emp where mgrid is null

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select ename,empno,sal from emp where sal between 1200 and 1400

--4.Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
select ename,sal+sal*0.1'rise in sal' from emp where deptno=20

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select count(*)as 'NO OF CLERKS' from emp where job='CLERK'

--6. Find the average salary for each job type and the number of people employed in each job. 
select avg(sal) as 'Average Salary',job,count(empno) as 'Number Of Employee'from emp group by job

--7. List the employees with the lowest and highest salary. 
select * from emp where SAL=(select min(sal) as 'Lowest Salary' from emp) or sal=(select max(sal) as 'Highest Salary' from emp)

--8. List full details of departments that don't have any employees
select * from dept where deptno not in (select deptno from emp )

-- 9.Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select ename,sal from emp where job='analyst' and sal>1200 and deptno=20 order by ename asc 

--10. For each department, list its name and number together with the total salary paid to employees in that department.
select dname, sum(sal) from dept join emp on dept.deptno=emp.deptno group by dname

--11. Find out salary of both MILLER and SMITH.
select ename,sal from emp where ename in('miller','smith')

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
select ename from emp where ename like 'A%'or ename like 'M%' order by ename

--13. Compute yearly salary of SMITH. 
select (sal*12) from emp where ename='SMITH'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename,sal from emp where sal not between 1500 and 2850

--SET - II
--1. Retrieve a list of MANAGERS. 
select * from emp where job='MANAGER'

--2. Find out the names and salaries of all employees earning more than 1000 per month.
 select ename,sal from emp where sal>1000

 --3. Display the names and salaries of all employees except JAMES. 
 select ename,sal from emp where ename not in ('JAMES')

 --4. Find out the details of employees whose names begin with ‘S’. 
 select * from emp where ename Like 'S%'

 --5.Find out the names of all employees that have ‘A’ anywhere in their name. 
 select ename from emp where ename like '%a%'

 --6. Find out the names of all employees that have ‘L’ as their third character in their name. 
 select ename from emp where ename like '__L%'

 --7. Compute daily salary of JONES. 
 select (sal/30) from emp where ename='JONES'

 --8. Calculate the total monthly salary of all employees. 
 select sum(sal) from emp

  --9. Print the average annual salary . 
select avg(sal)*12 from emp

--10. Select the name, job, salary, department number of all employees except  SALESMAN from department number 30. 
 select ename,job,sal,deptno from emp where deptno=30 and job not in ('SALESMAN') 
 
 --11. List unique departments of the EMP table. 
 select distinct(dname)from emp inner join dept on emp.deptno=dept.deptno

 --12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
 select ename as Employee , sal as Salary from emp where deptno= 10 or deptno= 30 And sal>1500

 --13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
  select ename,job,sal from emp where job='MANAGER' OR job='ANALYST' and sal != 1000 and sal!= 3000 and sal !=5000

  --14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
  select ename,sal,comm from emp where comm>sal*1.1

    --15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
   select ename from emp where ename like '%l%l% ' and (deptno=30 or mgrid=7782)
   select * from emp

   --16. Display the names of employees with experience of over 10 years and under 20 yrs.Count the total number of employees.
   select ename from emp where DATEDIFF(year,hiredate,getdate())>10 and DATEDIFF(year,hiredate,getdate())<20

   --17.Retrieve the names of departments in ascending order and their employees in descending order.
   select dname,ename from emp  inner join dept on emp.deptno=dept.deptno order by dname asc, ename desc

   --18.Find out experience of MILLER. 
    select DATEDIFF(year,hiredate,getdate())As 'experience' from emp where ename='miller'

