create table hello(
masp int not null,
tensp varchar(40) null,
)
go
insert into  hello values (11,'hello')
insert into  hello (masp) values (11)
insert into  hello (tensp) values ('hello')
go
alter table hello
add price money not null default(100)
go
insert into  hello(masp,tensp) values (12,'chao')
select * from hello
go
insert into  hello(masp,tensp,price) values (12,'chao',10)

go
create table cellularphone(
person_id uniqueidentifier default newid() not null,
person_name varchar(60) not null,
)
go
insert into cellularphone(person_name) values ('hello')
select*from cellularphone
go
alter table cellularphone 
add person_id2 int identity(500,1) not null


go
use hienhy
go
exec sp_rename 'lophoc','hola';
GO
CREATE  TABLE Student(
StudentName nvarchar(50),
Age int,
DOB datetime,
)
go
insert into Student values('Bin Bin',20,'09-22-1999')
insert into Student values('Quoc Quoc',21,'09-22-1999')
insert into Student values('Bin Bin',22,'09-22-1999')
insert into Student values('Bin Bin',23,'09-22-1999')
insert into Student values('Bin Bin',24,'09-22-1999')
go
alter table Student
add StudentID uniqueidentifier default newid() not null; 
go
alter table Student
add primary key (StudentID)
go
create table Lop_Hoc(
MaLop varchar(50) primary key,
TenLop varchar(50)
)
go
alter table Student
add Malop varchar(50)
go
alter table Student
add constraint fk foreign key (Malop)references Lop_Hoc(MaLop)
go
select * from Student
insert into Lop_Hoc(MaLop,TenLop) values('T2203','aptech')
insert into Lop_Hoc(MaLop,TenLop) values('T2204','aptech')
insert into Lop_Hoc(MaLop,TenLop) values('T2205','aptech')
insert into Lop_Hoc(MaLop,TenLop) values('T2206','aptech')
go
insert into Student(MaLop) values('T2203')
insert into Student(MaLop) values('T2204')
insert into Student(MaLop) values('T2205')
insert into Student(MaLop) values('T2206')


