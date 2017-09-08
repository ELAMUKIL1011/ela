create table customersinfo
(
customerid int identity (100,1) primary key,
customername varchar(30),
customercity varchar(30),
customeraddress varchar(100),
customermobilenumber varchar (10)unique,
pan varchar(10)unique,
customerpassword varchar(10)
)
 create table accountinfo
 (
 accountid int identity(10,1) primary key,
 customerid int not null foreign key references customersinfo (customerid),
 accounttype varchar(10),
 accountbalance int,
 accountopendate datetime ,
 accountstatus varchar(10) check (accountstatus in ('open','closed','blocked'))
 )
 
 
 create table transactionsinfo
 (
 transactionid int identity (1000000,1)primary key,
 accountid int not null foreign key references accountinfo(accountid),
 transactiontype varchar (3)check (transactiontype in ('D','C')),
 amount int not null check(amount >0),
 transactiondate datetime
 )
 
 select * from customersinfo
insert customersinfo values('abi','chennai','adayar','9500267630','ACLPE5097','1234564') 
insert customersinfo values('anu','mumbai','kk nagar','9500267631','ACLPE5197','1234567')
insert customersinfo values('bala','chennai','tambaram','9500267632','ACLPE5297','1234568')
insert customersinfo values('chandru','kolkatta','auro bridge','9500267633','ACLPE5397','1234569')
insert customersinfo values('aadityaa','mumbai','light area','9500267634','ACLPE5497','1234561')
insert customersinfo values('swetha','pune','rajaji nagar','9500267635','ACLPE5597','1234562')
insert customersinfo values('vignesh','pune',' hilton','9500267636','ACLPE6697','1234563')
insert customersinfo values('banu','mumbai','kk nagar','9500267641','ACLPE6197','2234567')
insert customersinfo values('balakumaran','chennai','tambaram','9500267642','ACLPE6297','2234568')
insert customersinfo values('chandhini','kolkatta','auro bridge','9500267643','ACLPE6397','2234569')
insert customersinfo values('akalya','mumbai','light area','9500267644','ACLPE6497','2234561')
insert customersinfo values('swathi','pune','rajaji nagar','9500267645','ACLPE6597','2234562')
insert customersinfo values('vinujsah','pune',' hilton','9500267646','ACLPE6697','2234563')

insert transactionsinfo values (10,'D',200,10/10/2017)
insert transactionsinfo values (11,'D',2000,10/10/2017)
insert transactionsinfo values (12,'C',1200,11/10/2017)
insert transactionsinfo values (13,'D',2200,10/11/2017)
insert transactionsinfo values (14,'C',5200,10/12/2017)
insert transactionsinfo values (15,'D',2000,10/05/2017)
insert transactionsinfo values (16,'C',1200,11/02/2017)
insert transactionsinfo values (17,'D',2200,10/01/2017)
insert transactionsinfo values (18,'C',5200,10/08/2017)
update transactionsinfo set transactiondate='10/10/2017' where transactionid=1000000
update transactionsinfo set transactiondate='12/10/2017' where transactionid=1000001
update transactionsinfo set transactiondate='05/10/2017' where transactionid=1000002
update transactionsinfo set transactiondate='02/10/2017' where transactionid=1000003
update transactionsinfo set transactiondate='03/10/2017' where transactionid=1000004
update transactionsinfo set transactiondate='11/10/2017' where transactionid=1000004
update transactionsinfo set transactiondate='10/10/2017' where transactionid=1000005
update transactionsinfo set transactiondate='10/10/2017' where transactionid=1000006
update transactionsinfo set transactiondate='10/10/2017' where transactionid=1000007
update transactionsinfo set transactiondate='10/10/2017' where transactionid=1000008
 insert transactionsinfo values (10,'D',200,'10/10/2017')
insert transactionsinfo values (11,'D',2000,'10/10/2017')
insert transactionsinfo values (12,'C',1200,'11/10/2017')
insert transactionsinfo values (13,'D',2200,'10/11/2017')
insert transactionsinfo values (14,'C',5200,'10/12/2017')
insert transactionsinfo values (15,'D',2000,'10/05/2017')
insert transactionsinfo values (16,'C',1200,'11/02/2017')
insert transactionsinfo values (17,'D',2200,'10/01/2017')
insert transactionsinfo values (18,'C',5200,'10/08/2017')
 select * from accountinfo
insert accountinfo values (100,'savings',12000,'12/12/2012','open')
insert accountinfo values (101,'savings',19000,'03/03/2012','open')
insert accountinfo values (102,'current',1000,'02/10/2012','closed')
insert accountinfo values (103,'savings',12000,'10/10/2012','open')
insert accountinfo values (104,'savings',5000,'11/11/2012','open')
insert accountinfo values (105,'current',12500,'10/12/2012','open')
insert accountinfo values (106,'savings',125600,'02/05/2012','closed')
insert accountinfo values (107,'current',120,'12/09/2012','blocked')
insert accountinfo values (108,'savings',12000,'12/12/2012','open')
insert accountinfo values (109,'savings',19000,'03/03/2012','open')
insert accountinfo values (110,'current',1000,'02/10/2012','closed')
insert accountinfo values (111,'savings',120000,'10/10/2012','open')
insert accountinfo values (104,'savings',500000,'11/11/2012','open')
insert accountinfo values (112,'current',1250000,'10/12/2012','open')
insert accountinfo values (101,'savings',125600,'02/05/2012','closed')
insert accountinfo values (102,'current',12000,'12/09/2012','blocked')

select * from transactionsinfo

 
--1--
 select top 5 * from transactionsinfo where accountid=18 order by transactiondate desc
select * from transactionsinfo where accountid=10 and transactiondate between '10/10/2017'  and '10/11/2017'
select * from accountinfo where customerid=101

select customerid,customername,customeraddress,customermobilenumber
   from customersinfo where customerid in
(
select customerid from accountinfo
 group by customerid having count(accountid)>1

)
select * from accountinfo where accountid in
(
select accountid from transactionsinfo group by accountid having  count (transactionid ) >1

)
select * from customersinfo where customerid not in
(
select customerid from accountinfo where accountid in
( 
select accountinfo.accountid   from accountinfo 
left outer join transactionsinfo on accountinfo.accountid =transactionsinfo.accountid 
group by accountinfo.accountid having count(transactionsinfo.transactionid)>1
) 
)

select customersinfo.customerid, customersinfo.customername,accountinfo.accountid,accountinfo.accountbalance
 from customersinfo 
join accountinfo on customersinfo.customerid= accountinfo.customerid
order by customersinfo.customerid asc

select accountinfo.accountid,accountinfo.accountbalance , count(transactionsinfo.transactionid)as 
numberoftransactions
 from accountinfo join transactionsinfo on transactionsinfo.accountid= accountinfo.accountid
  group by
accountinfo.accountid,accountinfo.accountbalance 

select customersinfo.customerid,customersinfo.customername, 
accountinfo.accountid,accountinfo.accountbalance , 
count(transactionsinfo.transactionid)as 
numberoftransactions
 from customersinfo 
 
 join accountinfo on accountinfo.customerid=customersinfo.customerid
 join transactionsinfo on transactionsinfo.accountid= accountinfo.accountid
group by customersinfo.customerid,customersinfo.customername,
accountinfo.accountid,accountinfo.accountbalance



select count(*) from customersinfo where customerid=100 and customerpassword='123654'





-----------proceduresss--


create table logindetails
(
customerid int not null foreign key references customersinfo(customerid),
logindate datetime

)


select * from logindetails

create  proc pro_login (@customerid int,@customerpassword varchar(30))
as
begin
 declare @count int =0;
 select @count= count(*) from customersinfo where 
 customerid=@customerid
 and 
 customerpassword =@customerpassword;
 if(@count>0)
 begin
 
 insert logindetails values(@customerid,getdate())
 
 end
 return @count;
 end
 
 declare @ret int
 exec @ret =pro_login 100,'123456'
 select @ret
 
 
 
 create proc pro_customerdetails (@customerid int ,@customername varchar(30) output,
  @customermobilenumber varchar(30)output)
 
 as
 begin
 if((select count(*)from customersinfo where customerid =@customerid)>0)
 begin
 select @customername=customername ,@customermobilenumber= customermobilenumber
 from customersinfo
 where customerid =@customerid
 end
 else
 begin
 set @customername='na'
 set @customermobilenumber='na'
 end
 end
 
 
 declare @customerid int
 declare @customername varchar(30)
 declare @customermobilenumber varchar(30)
 set @customerid=104
 exec pro_customerdetails @customerid,@customername output,
 @customermobilenumber output
 select @customerid,@customername,@customermobilenumber
 
 
 ----triggers---------
 
 
 create table customersdetails
 (
 customerid int identity (100,1),
 customername varchar (30),
 customercity varchar (10)
 
 
 )
 select * from customersdetails
 
 insert customersdetails values ('élamukil ','chennai')
 
 create trigger trg_customersdetails_insert
 on customersdetails
 for insert
 as 
 begin
  select 'trigger fired'
end 


create trigger trg_customersdetails_insert
 on customersdetails
 for insert
 as 
 begin
  select 'trigger fired'
end 




create table stocks
(
itemid int ,
stockitemqty int,
)
insert stocks values(1,400) 
insert stocks  values(2,100) 
insert stocks values(3,300) 
insert stocks values(4,800) 


 create table orderss
 (
 orderid int identity (100,1) primary key,
 itemid int,
 itemqty int,
 customername varchar (30)
 )

 
 select * from stocks
 select * from orderss
 
 
 create trigger trg_update_stocksss
 on
 orderss
 for insert
 as
 begin
 
 declare @itemid int
 declare @itemqty int
 select @itemid=itemid , @itemqty =itemqty from inserted
 update stocks set stockitemqty=stockitemqty-@itemqty  where itemid=@itemid
 if ((select stockitemqty from stocks where itemid=@itemid)<0)
 begin
 rollback tran -- cancels the insert--
 end
 end
 
 
 

insert orderss values (1,299,'ela')

create table employeeinfo
(
empid int identity (1,1),empname varchar (30),empcity varchar (30)

)
declare @count int =0
while (@count <50000)
begin
insert employeeinfo values ('abc','chennai')
set
 @count =@count+1
 end
 select * from employeeinfo where empid =25000
 create clustered index idx_empid
 on employeeinfo(empid)
 
 
 select * from customers
 
 select * into customersnew from customers
 
 
 
  select * from customers union   select * from customersnew
   select * from customers union all  select * from customersnew
    select * from customers intersect   select * from customersnew
     select * from customers except   select * from customersnew
 
 
 select  * from invoiceitems
  select  * from invoices
 select invoiceid,invoicedate,'invoice level ' =
 case
  when (select sum(itemqty*itemprice)from invoiceitems d
  where d.invoiceid=i.invoiceid)> 25000 then 'level 1'
  
 when(sum(itemqty*itemprice)from invoiceitems d
 where d.invoiceid=i.invoiceid) >1000 then 'level 2'
 
  when(sum(itemqty*itemprice)from invoiceitems d
 where d.invoiceid=i.invoiceid) >4000 then 'level 3'
 
 else 'level 4' end

 from invoices i