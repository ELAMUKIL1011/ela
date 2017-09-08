create database InvoicesDB
use InvoicesDB
create table cities
(
cityid int identity (1,1) primary key,
cityname varchar(30) not null
)


create table customers
(customerid int identity (1000,1)primary key,
customername varchar(max) not null,
customercityid int not null
foreign key references cities (cityid),
customeremailid varchar(200) not null unique,
customercontactnumber varchar(15) not null unique
)



create table items
(
itemid int identity (100000,1) primary key,
itemname varchar(100) not null,
itemprice int not null check (itemprice >0),
itemstatus bit not null
)

create table invoices
(
invoiceid int identity (100,1) primary key,
customerid int not null foreign key references customers(customerid),
invoiceaddress varchar(max) not null,
invoicedate datetime not null,
invoicecityid int not null foreign key references cities (cityid),
invoicestatus varchar(30) not null,
gstno varchar (100) null,
)
alter table invoices add paymenttype varchar(30) check(paymenttype in ('COD','debit','credit'))

create table invoiceitems
(
invoiceid int not null foreign key references invoices(invoiceid),
itemid int not null foreign key references items(itemid),
itemqty int not null check (itemqty>0),
itemprice int not null check (itemprice >0),
primary key (invoiceid , itemid)
)
insert cities values('chennai')
insert cities values('pune')
insert cities values ('kolkatta')
insert cities values ('mumbai')
insert cities values('kerla')
insert cities values ('karnataka')
insert cities values ('manipur')
select * from cities 

insert customers values('abi',1,'abi123@gmail.com','9500026763')
insert customers values('anu',2,'anu2323@gmail.com','9512365411')
insert customers values('bala',3,'bala3456@gmail.com','9103652223')
select * from customers
insert customers values('chandhru',4,'chandhu@gmail.com','9512589643')
insert customers values('jenny',5,'jenny@gmail.com','8569526763')
insert customers values('abirami',6,'abi13@gmail.com','9505548963')
insert customers values('nikitha',7,'niki@gmail.com','950002732323')
insert customers values('nivetha',1,'nivety5673@gmail.com','950010263')
insert customers values('sai',2,'ssssaaaii@gmail.com','9500025239987')
insert customers values('partha',1,'parthuy23@gmail.com','95001026763')
insert customers values('swetha',3,'swe4567@gmail.com','950008926763')
insert customers values('kavya',4,'kavystyu@gmail.com','950002674563')

select * from items
insert items values ('mobile',10000,0)
insert items values ('laptop',50000,1)
insert items values ('furniture',100000,1)
insert items values ('telephone',100,0)
insert items values ('fidgetspinner',10,1)
insert items values ('camera',105200,1)
insert items values ('bagpack',1020,0)
insert items values ('utensils',102,1)
insert items values ('tv',2000,1)
insert items values ('vehicle',20000,1)


select * from invoices 
insert invoices values (1002,'homedelivery','02/02/2017',1,'shipped',123654,'COD')
insert invoices values (1003,'office adress','03/03/2017',1,'shiiped',23145,'debit')
insert invoices values (1004,' school address','10/10/2017',1,'pending',12523,'credit')
insert invoices values (1005,'workshop address','01/02/2017',1,'deliverd',12365,'COD')
insert invoices values (1002,'ascendas','03/02/2017',1,'shipped',89634,'debit')
insert invoices values (1003,'perungudi','04/02/2017',1,'pending',8933154,'COD')
insert invoices values (1005,'kk nagar','05/02/2017',1,'pending',7894,'credit')
insert invoices values (1006,'homedelivery','06/02/2017',1,'shipped',1254,'debit')
insert invoices values (1006,'homedelivery','02/02/2017',1,'shipped',123654,'COD')
insert invoices values (1007,'office adress','03/03/2017',2,'shiiped',231415,'debit')
insert invoices values (1004,' school address','10/10/2017',3,'pending',125123,'credit')
insert invoices values (1003,'workshop address','01/02/2017',4,'deliverd',123165,'COD')
insert invoices values (1002,'ascendas','03/02/2017',4,'shipped',896314,'debit')
insert invoices values (1003,'perungudi','04/02/2017',4,'pending',89313154,'COD')
insert invoices values (1003,'kk nagar','05/02/2017',6,'pending',78914,'credit')
insert invoices values (1006,'homedelivery','06/02/2017',7,'shipped',11254,'debit')
insert invoices values (1006,'homedelivery','06/02/2017',7,'shipped',112545,'debit')


insert invoiceitems values (103,100001,2,50000)
insert invoiceitems values (104,100002,2,50000)
insert invoiceitems values (105,100003,2,50000)
insert invoiceitems values (106,100001,2,50000)
insert invoiceitems values (107,100002,2,50000)
insert invoiceitems values (108,100005,2,50000)
insert invoiceitems values (109,100007,2,50000)
insert invoiceitems values (110,100006,2,50000)

insert invoiceitems values (111,100005,2,50000)


insert invoiceitems values (104,100006,2,50000)

select * from cities
select * from customers
select * from items
select * from invoices
select * from invoiceitems
--------- sub query-----------
select * from customers where customerid in
(

select distinct customerid from invoices
)

select * from customers where customerid in
(

select distinct customerid from invoices
)

-----------employee database-----------
select * from employees
select * from employees where employeesalary >all (
select avg(employeesalary) from employees group by employeedept
)
select * from items where  itemid not in
(
select distinct itemid from invoiceitems where invoiceid  in
(

select invoiceid from invoices where datepart (yy,(invoicedate)) = datepart(yy,getdate())
)
)


select * from customers where customerid in
(
select customerid from invoices where invoiceid in 
(
select  top 1 with ties  invoiceid  from invoiceitems group by invoiceid
order by sum(itemqty*itemprice) desc
)
)


------------ co related sub query---------------

select * from employees e1 where e1.employeesalary >=
(
select avg (e2.employeesalary) from employees e2
where e2.employeedept= e1.employeedept

)


select * from customers
select * from cities

-----------inner join equi------------
select customers.customerid, customers.customername,cities.cityname 
from customers join cities on customers.customercityid= cities.cityid


select * from cities
select * from customers
select * from items
select * from invoices
select * from invoiceitems


select invoices.invoiceid, invoices.invoicedate, customers.customername, 
invoices.customerid,invoices.invoiceaddress ,invoiceitems.itemid ,invoiceitems.itemqty, 
invoiceitems.itemprice,items.itemname 
from invoices 
join customers on invoices.customerid = customers.customerid 
join invoiceitems on invoices.invoiceid=invoiceitems.invoiceid
join items on invoiceitems.itemid=items.itemid


 select invoices.invoiceid, invoices.invoicedate,sum(invoiceitems.itemqty*invoiceitems.itemprice)
from invoices 
join invoiceitems on invoices.invoiceid=invoiceitems.invoiceid
group by invoices.invoiceid,invoices.invoicedate


--------outer left-------
select invoices.invoiceid ,customers.customerid , customers.customername 
from customers left outer join
invoices  on customers.customerid=invoices.customerid

select invoices.invoiceid ,customers.customerid , customers.customername 
from invoices right outer join
customers  on customers.customerid=invoices.customerid

select invoices.invoiceid ,customers.customerid , customers.customername 
from invoices left outer join
customers  on customers.customerid=invoices.customerid

select invoices.invoiceid ,customers.customerid , customers.customername ,isnull(invoices.invoiceid,'0')
from invoices right outer join
customers  on customers.customerid=invoices.customerid




create table employeedata
(
employeeid int identity(100,1)primary key,
employeename varchar(30)not null,
employeedept varchar(30) not null,
managerid int
foreign key references employeedata(employeeid)
)
insert employeedata values ('abi','HR',null)
insert employeedata values ('arun','IT',100)
insert employeedata values ('bala','IT',103)

insert employeedata values ('chandru','HR',null)
insert employeedata values ('robert','IT',100)
insert employeedata values ('dennis','IT',103)

select * from employeedata


---- self join-------------
select e1.employeeid,e1.employeename,e1.employeedept,m1.employeename from employeedata e1 
left outer join employeedata m1
 on e1.managerid=m1.employeeid
 
 
 create table students 
 (
 studentname varchar (30),
 studentid int identity (100,1),
studentmarks int 
 )
 
 create table grades
 (
grades varchar(3),
minmarks int,
maxmarks int

 )
 insert students values ('elamukil',85)
  insert students values ('aishu',20)
   insert students values ('aadilal',35)
    insert students values ('robert',95)
     insert students values ('swetha',56)
      insert students values ('shri',25)
      
      
       insert grades values ('S',90,100)
       insert grades values ('A',85,90)
       insert grades values ('B',80,85)
       insert grades values ('C',70,80)
       insert grades values ('D',45,70)
       insert grades values ('F',0,45)
       select * from students
         select * from grades
         
         
         select students.studentid,students.studentname,grades.grades 
         from students 
         join grades
         on  
        students.studentmarks>= grades.minmarks and students.studentmarks <= grades.maxmarks
        
        
        
        
        
declare @count int =0
set @count =102
if (@count >100)
begin
select 'more than 100'
end
else
begin
select 'less than 100'
end  



declare @empid int =1001
declare @employeename varchar(100)
select @employeename = employeefname from employees
where employeeid= @empid
select @employeename     


declare @count int =0
while (@count <10)
begin
select @count
set @count=@count+1
end





create proc pro_invoicedetails 
as


   select invoices.invoiceid, invoices.invoicedate, customers.customername, 
invoices.customerid,invoices.invoiceaddress ,invoiceitems.itemid ,invoiceitems.itemqty, 
invoiceitems.itemprice,items.itemname
 from invoices 
 join customers on invoices.customerid = customers.customerid 
join invoiceitems on invoices.invoiceid=invoiceitems.invoiceid
join items on invoiceitems.itemid=items.itemid   


exec pro_invoicedetails

