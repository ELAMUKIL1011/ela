create database inautixaug2017batch
use inautixaug2017batch
create table customers
(
customerid int,
customername varchar(30),
customercity varchar(30),
customerage int)
sp_help customers
select * from customers
insert customers values(1001,'ABC','chennai',25)
insert customers values(1002,'XYZ','chennai',20)
insert customers values(1003,'MNO','pune',15)
insert customers values(1004,'QRS','mumbai',30)
insert customers values(1005,'EFG','odissa',32)
select * from customers
insert customers values(1006,'TYU','madurai',null)
select * from customers
insert customers(customerid,customercity,customername)values(1007,'chennai','POJ')
select * from customers
update customers set customercity='pune'where customerid=1001
select * from customers
update customers set customercity='noida',customerage= 50 where customerid=1005
select * from customers
delete customers where customerid=1004
sp_help customers

alter table customers add customercontactnumber varchar(20)
select * from customers
alter table customers drop column customercontactnumber
select * from customers
---comments--
alter table customers alter column customername varchar(100)
sp_help customers
sp_rename 'customers','customersinfo'
select * from customers
select * from customersinfo
sp_rename 'customersinfo','customers'
select * from customers
sp_rename 'customers.customername','customerfullname'
select * from customers
------drop table customers-----
create table employees
(
employeeid int,
employeefname varchar(30),
employeelname varchar (30),
employeedob datetime,
employeesalary int,
employeedept varchar(30),
employeecity varchar (30)
)
insert employees values(1001,'will','smith','12/12/1995',30000,'IT','chennai')
insert employees values(1002,'jhon','snow','01/01/1965',25000,'CSE','mumbai')
insert employees values(1003,'jackie','chan','01/03/1967',12000,'ECE','pune')
insert employees values(1004,'gerald','winston','02/02/1933',18000,'EEE','gauhathi')
insert employees values(1005,'arnold','bean','04/12/1987',22000,'MECH','noida')
insert employees values(1006,'robert','pattinson','11/10/1995',30000,'IT','chennai')
insert employees values(1007,'emma','watson','05/05/1998',20000,null,'chennai')
insert employees values(1008,'taylor','launther','10/12/1990',35000,'null','gurgaon')
select * from employees
update employees set employeedept= null where employeeid=1008
select * from employees 
select employeeid,employeefname,employeelname from employees
select employeeid,employeefname+''+employeelname as 'employeename' from employees
select employeeid,employeefname+''+employeelname as 'employeename' from employees where employeecity='chennai' and employeedept='IT'
select * from employees where employeecity in('chennai','pune','noida')
select * from employees where employeedept is null
select * from employees where employeesalary between 20000 and 30000
select * from employees where employeesalary not between 20000 and 30000
select * from employees order by employeesalary desc
select * from employees order by employeesalary desc,employeedept asc
select top 1  * from employees order by employeesalary desc
select top 1 with ties * from employees order by employeesalary desc
select employeecity from employees 
select distinct employeecity from employees
select distinct employeecity,employeeid from employees
select employeeid,len(employeefname) from employees
select * from employees order by len(employeefname) desc
select substring (employeefname,1,3)  from employees
select ltrim( employeefname) from employees
select rtrim (employeefname) from employees
select lower(employeefname) from employees
select upper (employeefname) from employees
select left (employeefname,2) from employees
select right(employeefname,2) from employees
select isnumeric(employeefname) from employees
select ceiling(25.01)
select floor(25.99)
select round(236.66956,2)
select isnull(employeedept,'NA')from employees




select sum(employeesalary) from employees
select max(employeesalary) from employees
select min (employeesalary) from employees
select avg(employeesalary) from employees
select count(*) from employees
select count(*) from employees where employeeid=1009
select count (* ) from employees where employeecity='chennai'
select getdate()
---insert orders value(10001,'abcd',2500,getdate())---
select dateadd(mm,10,getdate())
select datediff(yyyy,'11/10/1995',getdate())

select employeeid,employeefname,employeelname,datediff(yyyy,employeedob,getdate())as 'age' from employees
select employeeid,employeefname,datename(mm,employeedob)as 'employeemonth' from employees
select employeeid ,employeefname from employees where datename(mm,employeedob)= datename (mm,getdate())
select convert (varchar(30), employeeid)+'  -  '+employeefname, convert(varchar(30),employeedob,6) as info from employees
select employeeid,employeefname,employeelname, cast(employeesalary as decimal(12,2)) from employees
select employeedob from employees
select * from employees
select employeecity ,count(*) from employees group by employeecity
select employeecity,employeedept, count(*),sum(employeesalary) from employees group by employeecity,employeedept
select employeecity,employeedept, count(*),sum(employeesalary) from employees group by employeecity,employeedept having count(*)>1
select employeecity,employeedept, count(*),sum(employeesalary) from employees where employeesalary >10000 group by employeecity,employeedept having count(*)=1 order by  count(*) asc
select  top 1 employeedept,avg(employeesalary) from employees group by employeedept order by avg(employeesalary) desc



------new table-------
create table accounts
(
accountid int identity(100,1),
customername varchar (30),
accountbalance int,
accountopendate datetime
)
insert accounts values ('elamukil',1000,getdate())
insert accounts values ('aishwariya',1000,getdate())
insert accounts values ('rahul',1000,getdate())
insert accounts values ('aadityaa',1000,getdate())
select * from accounts
select @@identity
insert accounts values ('akalya',1000,getdate())
select @@identity
------jj------
select @@identity