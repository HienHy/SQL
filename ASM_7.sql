use master
go
if exists (select * from sys.databases where name='ASM_7')
drop database ASM_7
go
create database ASM_7
go
use ASM_7
go
--Bảng khách hàng
create table Time_(
Time_Id int identity(100,1) primary key,
name varchar(30),
Date_ date check (Date_>=getdate() and Date_ < (getdate() + 30)),
)
go
drop table Time_
go
insert into Time_ (name,Date_)
values
('hien','06-18-2022'),
('hien','06-18-2022'),
('hien','06-18-2022'),
('hien','06-18-2022'),
('hien','06-18-2022')


create table Time_2(
Time_Id int identity(100,1) primary key,
name varchar(30),
Date_ date check (Date_>=getdate() and Date_ < (getdate() + 30)),
)
insert into Time_2 (name,Date_)
select name,Date_ from Time_


select * from Time_
select * from Time_2