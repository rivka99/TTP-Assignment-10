--Payroll Database--

--drops the tables if they already exist
drop table if exists employee;
drop table if exists contact;
drop table if exists payInfo;
drop table if exists Department; 

--creates employe table that holds names, ids and DOBs
create table employee(
    ID int primary key,
    fname varchar(30) , 
    lname varchar(30),
    DOB date
);
--This creates the Contact table which is the contact info for each employee, referenced by their id
--It is necessary for sending payroll communication/checks in the mail
create table contact(
    ID int,
    Address1 varchar(30),
    Phone int,
    Email varchar(30)
);
--this creates table payInfo which includes bonuses, depID which is used by the Department table
--and a bool that tells if the employee has a 401k
create table payInfo(
    DepID int,
    ID int,
    Bonuses int,
    Salaryover401k BIT
);
--This creates the Department table it includes the id for the employee and for their department
-- it includes the worker's title, and an array of their subordinates.
create table Department(
    ID int,
    DepID int,
    Title varchar(30),
    Subordinates text[]
);

-- the following 16 queries add data into each table
insert into employee values (1,'Vincent','Lau','2000-05-26');
insert into employee values (2,'Daniel','Chabi','2006-05-26');
insert into employee values (3,'Rivka','Bar-Chaim','2007-05-26');
insert into employee values (4,'Taylor','Swift','2000-05-26');

insert into contact values (1,'Roads 21',1234567890,'electricplasma411@gmail.com');
insert into contact values (2,'Newport 22',1234567891,'danielchabi97@gmail.com');
insert into contact values (3,'Skagen 23',1234567892,'Rose@ndew.net');
insert into contact values (4,'Swift Ln',1234567893,'blankspace@you.net');

insert into payInfo values (101,1,4450,B'1');
insert into payInfo values (102,2,7600,B'0');
insert into payInfo values (103,3,12333,B'1');
insert into payInfo values (104,4,12332,B'0');

insert into Department values (1,101,'SSI Worker','{"Bob","Clair"}');
insert into Department values (2,102,'Secretary','{"none"}');
insert into Department values (3,103,'Manager','{"Anthony"}');
insert into Department values (4,104,'Singer','{"Kanye","Ale Person"}');

--This query joins the employee and contact table
select a.ID,fname,lname,email,Address1,phone  from employee a 
    inner join contact b on a.ID=b.ID ;
--This query joins the employee, contact, and payInfo Tables
select a.ID,c.DepID,fname,lname,email,Address1,phone,Bonuses,Salaryover401k from employee a 
    inner join contact b on a.ID=b.ID 
    inner join payInfo c on a.ID=c.ID;
--This query joins the employee, contact, Department and payInfo Tables
select d.ID,c.DepID,fname,lname,email,Address1,phone,Title,Subordinates,Bonuses,Salaryover401k from employee a 
    inner join contact b on a.ID=b.ID 
    inner join payInfo c on a.ID=c.ID
    inner join Department d on c.ID=d.ID;