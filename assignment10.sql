--create a table

create table employee(
    fname varchar(30), 
    lname varchar(30),
    ID int,
    timeAtCompany int,
    DOB date
);

create table contact(
    ID int,
    Address1 varchar(30),
    Phone int,
    Email varchar(30)

)

create table payInfo(
    DepID int,
    ID int,
    Bonuses int,
    401k int
)

create table Department(
    ID int,
    DepID int,
    Title varchar(30),
    Subordinates SET,


)