create proc pro_updatecustomermobilenumberss
(@customerid int ,@customerpassword varchar(30),@customermobilenumber varchar (20))
as
begin
declare @count int =0
select @count = count (*) from customersinfo where customerid=@customerid
 and customerpassword=@customerpassword
if (@count>0)
begin
update customersinfo set customermobilenumber=@customermobilenumber where customerid=@customerid
return @count
end
else
begin
return @count
end
end

declare @result int
exec @result = pro_updatecustomermobilenumberss 100,'123456','987456321'
select @result

select * from customersinfo
select * from accountinfo
sp_help customersinfo

create proc pro_accountdetail (@customerid int)

as
begin
select  customersinfo.customerid, customersinfo.customername,accountinfo.accountid,accountinfo.accountbalance
 from customersinfo 
 join accountinfo 
 on customersinfo.customerid= accountinfo.customerid 
 where customersinfo.customerid =@customerid
 end
 
 exec pro_accountdetail 102
 
 select * from customersinfo
select * from accountinfo
select * from transactionsinfo


 create trigger trg_updateaccountbalance
 on transactionsinfo
 for insert 
 as
 begin
 declare @accountid int
 declare @type varchar(10)
 declare @amount int 
 select @accountid = accountid ,@type =transactiontype ,@amount=amount from inserted
 if (@type='D')
 begin
 update accountinfo set accountbalance =accountbalance + @amount where accountid =@accountid
 end
 else if (@type ='C')
 begin
 update accountinfo set accountbalance =accountbalance - @amount where accountid =@accountid
 end
 if ((select accountbalance from accountinfo where accountid = @accountid )<=0)
 begin
 
 rollback tran
 end
 end
 insert transactionsinfo values (14,'C',80000,'09/08/2017')

select * from accountinfo
select * from transactionsinfo
 