
if exists (select * from sys.databases where name='RevierPlate')
drop database RevierPlate
go
create database RevierPlate
go
use RevierPlate
go

create table Student(
StudentNo int Primary key,
StudentName varchar(50),
StudentAddress varchar(100),
PhoneNo int,
)
go
create table Department(
DeptNo int Primary key,
DeptName varchar(50),
ManagerName char(30)
)
go
create table Assignment(
AssignmentNo int primary key,
Description varchar(100)
)
go
create table Works_Assign(
JobID int primary key,
StudentNo int foreign key references Student(StudentNo),
AssignmentNo int foreign key references Assignment(AssignmentNo),
TotalHours int,
JobDetails XML
)
go
--1
alter table Works_Assign 
drop constraint FK__Works_Ass__Stude__2A4B4B5E

alter table Student
drop constraint PK__Student__32C4C02A314C2A0A

create clustered index IX_Student
on Student(StudentNo)

--2
alter index IX_Student on Student rebuild with(fillfactor = 60)

--3
create nonclustered index IX_Dept
on Department(DeptNo,DeptName,ManagerName)


