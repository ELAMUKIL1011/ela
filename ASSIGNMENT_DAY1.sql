create database EMP_DB_ASSIGNMENT
use Emp_DB_ASSIGNMENT
create table employees
(
employeeid int identity(1000,1),
employeefname varchar(15),
employeelname varchar(15),
employeesalary int,
employeestatus varchar(30)
) 
sp_help employees
alter table employees add employeedept varchar(30)
alter table employees add employeedoj datetime
insert employees values ('will','smith',10000,'working','HR','02/22/1996')
select * from employees
insert employees values ('jhon','snow',12000,'working','IT','12/12/2006')
insert employees values ('kristien','stewart',30000,'working','IT','05/05/2016')
insert employees values ('willson','smithyraj',10000,'working','HR','02/02/1990')
select * from employees
insert employees values ('taylor','lauther',12500,'resigned','finance','10/11/1995')
insert employees values ('taylor','gerald',1250,'resigned','finance','11/11/1996')
insert employees values ('robert','lauther',120000,'working','finance','10/10/2002')
insert employees values ('emma ','watson',12500,'working','IT','10/12/1995')
insert employees values ('mila','stauffer',12000,'working','IT','11/25/2007')
insert employees values ('arnold','lauther',30000,'working','HR','10/10/2003')
select * from employees
insert employees values ('arav','lau',30000,'working','HR','10/10/2008')
insert employees values ('oviya','helen',35000,'working','HR','10/10/2009')
alter table employees add employeecity varchar(30)
alter table employees add employeedob datetime
update employees set employeecity='chennai',employeedob='01/01/1987' where employeeid=1001
update employees set employeecity='pune',employeedob='01/01/1986' where employeeid=1000
update employees set employeecity='delhi',employeedob='01/01/1985' where employeeid=1002

update employees set employeecity='chennai',employeedob='01/01/1984' where employeeid=1003
update employees set employeecity='noida',employeedob='01/01/1983' where employeeid=1004
update employees set employeecity='chennai',employeedob='01/01/1987' where employeeid=1005
update employees set employeecity='calicut',employeedob='01/01/2000' where employeeid=1006
update employees set employeecity='kerla',employeedob='01/01/2001' where employeeid=1007
update employees set employeecity='gurgon',employeedob='01/01/1998' where employeeid=1008
update employees set employeecity='chennai',employeedob='01/01/1992' where employeeid=1009
update employees set employeecity='odissa',employeedob='01/01/1990 'where employeeid=1010
update employees set employeecity='chennai',employeedob='01/01/1950' where employeeid=1011
------ reports------
select * from employees where employeecity='chennai'
select *from employees where employeesalary between 25000 and 50000
select employeefname,employeelname,employeeid,employeecity from employees
select * from employees order by len(employeefname) asc
select count(employeeid) from employees
select sum(employeesalary) from employees
select * from employees where datename(mm,employeedoj)= 'january'
select * from employees where datediff(yy,employeedoj,getdate())>5
select employeedept , count(employeeid) from employees group by employeedept
select employeecity, count(employeeid) from employees group by employeecity
update employees set employeecity = 'pune' where employeecity='chennai'
select employeedept, sum(employeesalary) from employees  group by employeedept having sum(employeesalary)>50000
select employeefname,employeelname,employeeid,cast(employeesalary as decimal (12,4)) from employees 
create table employeesproject
(
employeeid int identity(1000,1),
projectname varchar(30),
duration int,
skillset varchar(100)
)
select *  from employeesproject
insert employeesproject values('.net',3,'programming')
insert employeesproject values('java',2,'frontend')
insert employeesproject values('.net',1,'core')
insert employeesproject values('mainframe',2,'frontend')
insert employeesproject values('java',3,'frontend')
insert employeesproject values('mainframe',4,'core')
insert employeesproject values('.net',3,'programming')
insert employeesproject values('java',2,'frontend')
insert employeesproject values('.net',1,'core')
insert employeesproject values('mainframe',2,'frontend')
select employeeid ,count(projectname) from employeesproject group by employeeid
update employees set employeestatus='resigned ' where employeecity='pune'
select * from employees where datename(mm,employeedoj)= datename(mm,getdate()) and datename(yy,employeedoj)= datename(yy,getdate())
select datename(yy,employeedoj), count(employeeid) from employees group by datename(yy,employeedoj)

