--create a table

create table employee(
    ID int primary key,
    fname varchar(30) , 
    lname varchar(30),
    DOB date
);
create table contact(
    ID int,
    Address1 varchar(30),
    Phone int,
    Email varchar(30)
);

create table payInfo(
    DepID int,
    ID int,
    Bonuses int,
    Salaryover401k BIT
);
create table Department(
    ID int,
    DepID int,
    Title varchar(30),
    Subordinates text[]
);

select * from employee;
select * from contact;
select * from payInfo;
select * from Department;

insert into employee values (1,'Vincent','Lau','2000-05-26');
insert into employee values (2,'Daniel','Chabi','2006-05-26');
insert into employee values (3,'Rivka','Bar-Chaim','2007-05-26');

insert into contact values (1,'Skagen 21','(123)-456-7890','electricplasma411@gmail.com');
insert into contact values (2,'Skagen 22','(123)-456-7890','danielchabi97@gmail.com');
insert into contact values (3,'Skagen 23','(123)-456-7890','2015-05-26');

insert into payInfo values (101,1,4450,1);
insert into payInfo values (102,2,7600,0);
insert into payInfo values (103,3,12333,1);

insert into Department values (1,101,"Social Security Worker",'{"Bob","Clair"}');
insert into Department values (1,102,"Secretary",'{"none"}');
insert into Department values (1,103,"Manager",'{"Anthony"}');


select fname, email from employee a inner join contact b on a.ID=b.ID;
