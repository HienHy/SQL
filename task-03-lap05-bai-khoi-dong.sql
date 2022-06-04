CREATE DATABASE booklibrary
go
CREATE TABLE book(
BookCode int primary key,
BookTitle varchar(100) NOT NULL,
Author varchar(50) NOT NULL,
Edition int,
BookPrice money,
Copies int,
)
go
CREATE TABLE Member(
MemberCode int primary key,
Name varchar(50) NOT NULL,
Address varchar(100) NOT NULL,
PhoneNumber int,
)
go
CREATE TABLE IssueDetails(
BookCode int constraint fk foreign key (BookCode) references Book(BookCode),
MemberCode int constraint fk1 foreign key (MemberCode) references Member(MemberCode),
IssueDate datetime,
ReturnDate datetime,
)
go
alter TABLE IssueDetails 
drop constraint fk
go
alter TABLE IssueDetails 
drop constraint fk1
go
alter TABLE Member 
drop constraint PK__Member__84CA6376F1B4D027
go
alter TABLE Book 
drop constraint PK__book__0A5FFCC612162C1E
go
alter Table Member
add constraint PKM primary key (MemberCode)
go
alter table Book
add constraint PKB primary key(BookCode)
go
alter table IssueDetails
add constraint fk foreign key (BookCode) references Book(BookCode)
go
alter table IssueDetails
add constraint fk2 foreign key (MemberCode) references Member(MemberCode)
go
alter table Book
add constraint dp check (BookPrice >0 and BookPrice <200)
go
alter table Member
add constraint dbp unique (PhoneNumber)
go
alter table IssueDetails
alter column BookCode int not null
go
alter table IssueDetails
alter column MemberCode int not null
go
alter table IssueDetails
add constraint PK_Issue primary key (BookCode,MemberCode)
go
insert into book values (100,'Gone With The Wind','Margaret Mitchell',10,100,10)
insert into book values (90,'Cay Cam Ngot Cua Toi','José Mauro de Vasconcelos',20,150,20)
insert into book values (80,'The GodFather','Mario Puzo',30,199,30)
insert into book values (70,'Tim Em Noi Anh','André Aciman',40,99,40)
go 
select * from book
go
insert into Member values (10,'Bin Bin','so 5 hang khoai',0908008880)
insert into Member values (11,'A Tien Bip','so 6 hang khoai',0908099999)
insert into Member values (12,'Quoc Quoc','so 7 hang khoai',0908008180)
insert into Member values (13,'Duong Minh Tuyen','so 8 hang khoai',0908308880)
go 
select *from Member
go
insert into IssueDetails values (70,10,'05-20-2021','06-20-2021')
insert into IssueDetails values (80,11,'05-20-2021','06-20-2021')
insert into IssueDetails values (90,12,'05-20-2021','06-20-2021')
insert into IssueDetails values (100,13,'05-20-2021','06-20-2021')
go
select* from IssueDetails