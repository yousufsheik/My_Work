use June1
create table Students
(StdId int primary key,
Stdname varchar(30),
Stdage int,
Stdaddress varchar(30)
)

select * from Students

create procedure All_one
@id int,
@name varchar(30),
@age int ,
@address varchar(40),
@option varchar(30)
as
begin  
if @option ='insert'
begin 
insert into Students values(@id, @name,@age,@address)
select * from Students
end

if @option ='update'
begin 
update Students set Stdname=@name,Stdage=@age,Stdaddress=@address  where StdId = @Id
select * from Students
end

if @option ='Delete'
begin 
delete Students where StdId=@id
select * from Students
end
if @option ='select'
begin 

 select * from Students
 end
end
exec All_one 3,'Fatima',23,'Karachi' ,'insert'
exec All_one 3,'Fatima',24,'Karachi' ,'update'
exec All_one 3,'Fatima',24,'Karachi' ,'delete'

select* from Employees
create procedure All_one1
@id int,
@name varchar(30),
@age int ,
@address varchar(40),
@Salary varchar(40),
@City varchar(40),
@option varchar(30)
as
begin  
if @option ='insert'
begin 
insert into Employees values(@id, @name,@age,@address,@Salary,@City)
select * from Employees
end

if @option ='update'
begin 
update Employees set EmpName=@name,EmpAge=@age,EmpAddress=@address,Salary=@Salary,City=@City  where EmpId = @Id
select * from Employees
end

if @option ='Delete'
begin 
delete Employees where EmpId=@id
select * from Employees
end
if @option ='select'
begin 

select * from Employees
end
end


--//insert
exec All_one 3,'Noreen' ,32, 'Karachi','insert'
exec All_one 4,'Shaista' ,37, 'Sadder','insert'
--//Update 
exec All_one 2,'Afreen' ,31, 'Orangi','update'
exec All_one 5,'Shaista' ,37, 'Sadder','insert'

--deleted row
exec All_one 5,'Shaista' ,37, 'Sadder','delete'
create table Employee_data
(Emp_Id int ,
Emp_name varchar(30),

Emp_Salary varchar(40))

create table Employee_data_backup
(Emp_Id int ,
Emp_name varchar(30),
Emp_Salary varchar(40),
Action_type varchar(30),
Action_time datetime,
)
create trigger insert_triggers on Employee_data
for insert 
as
declare @id int;
declare @name varchar(30);
declare @salary varchar(40);
declare @audit_type int;
select @id=Emp_Id from inserted;
select @name= Emp_name from inserted;
select @salary= Emp_Salary from inserted;
set @audit_type='data has been inserted'
insert into Employee_data_backup values (@id,@name,@salary,@audit_type,GETDATE())
print 'triggers has been fire.....'
insert into Employee_data values( 1, 'Shasita',34000)