--Phần I: Làm theo hướng dẫn – 15 phút
--Bài 1: Tạo và sử dụng một khung nhìn đơn giản.


CREATE DATABASE Lab11
GO
USE Lab11

go
CREATE VIEW ProductList
AS
SELECT ProductID, Name FROM Production.Product

go
select * from ProductList
--bài 2


CREATE VIEW SalesOrderDetail
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty as [Total Price]
FROM Sales.SalesOrderDetail od
JOIN Production.Product pr
ON od.ProductID=pr.ProductID

SELECT * FROM SalesOrderDetail



--Phần III: Bài tập tự làm – 45 phút


create table Customer(
CustomerID int identity primary key,
CustomerName varchar(50),
Address varchar(100),
Phone varchar(12)
)

insert into Customer values
('Xuan Tien','Thanh Hoa','099000000'),
('Bin Bin','Ha Noi','099898989'),
('Minh Duong','Thanh Hoa','099080080'),
('Quoc Quoc','Ha Noi','099020100'),
('Hien Nguyen','Hung Yen','0990012300')


create table Book(
BookCode int identity primary key,
Category varchar(50),
Author varchar(50),
Publisher varchar(50),
Title varchar(100),
Price int,
InStore int
)


insert into Book values
('Triet Hoc','Richard David Precht','Nha Nam','Toi la ai',150000,100),
('Tieu Thuyet','Murakami Haruki','Nha Nam','Rung Na Uy',100000,80),
('Bai Phat Bieu','Albert Einstein ','Tri Thuc','The gioi nhu toi thay',120000,50),
('Tieu Thuyet',' Albert Camus','Van Hoc','Nguoi dung',110000,60),
('Tieu Thuyet','Gabriel Gacia Marques','Van Hoc','Tram Nam Co Don',90000,60)

create table BookSold(
BookSoldID int identity primary key,
CustomerID int foreign key references Customer(CustomerID),
BookCode int foreign key references Book(BookCode),
Date datetime,
Price int,
Amount int
)

insert into BookSold values
(1,2,'06-20-2022',100000,5),
(1,2,'06-20-2022',100000,5),
(2,3,'06-20-2022',120000,2),
(2,3,'06-20-2022',120000,2),
(3,4,'06-20-2022',110000,1),
(3,4,'06-20-2022',110000,1),
(4,5,'06-20-2022',90000,4),
(4,5,'06-20-2022',90000,4),
(5,1,'06-20-2022',150000,3),
(5,1,'06-20-2022',150000,3)



/*Tạo một khung nhìn chứa danh sách các cuốn sách (BookCode, Title, Price) kèm theo số lượng đã
bán được của mỗi cuốn sách.*/
create view view_1_2
as
select b.BookCode,b.Title,b.Price,Amount
from BookSold bs inner join
Book b on b.BookCode=bs.BookCode



/*Tạo một khung nhìn chứa danh sách các khách hàng (CustomerID, CustomerName, Address) kèm
theo số lượng các cuốn sách mà khách hàng đó đã mua.*/
create view view_1_3
as
select C.CustomerID,C.CustomerName,C.Address,bs.Amount
from BookSold bs inner join
Customer C on C.CustomerID=bs.CustomerID


/*Tạo một khung nhìn chứa danh sách các khách hàng (CustomerID, CustomerName, Address) đã
mua sách vào tháng trước, kèm theo tên các cuốn sách mà khách hàng đã mua.*/
create view view_1_4
as
select C.CustomerID,C.CustomerName,C.Address,bs.Amount,B.Title
from BookSold bs 
inner join Customer C on C.CustomerID=bs.CustomerID
inner join Book B on B.BookCode=bs.BookCode and  month(EOMONTH(getdate())) - month(EOMONTH(Date))=1


/*Tạo một khung nhìn chứa danh sách các khách hàng kèm theo tổng tiền mà mỗi khách hàng đã chi
cho việc mua sách.*/
create view view_1_5
as
select C.CustomerName,Sum(Price*Amount) as Total
from Customer C
inner join BookSold bs on C.CustomerID=bs.CustomerID
group by C.CustomerName





select * from view_1_5
select * from view_1_4
select * from view_1_3
select * from view_1_2
select * from Book
select * from Customer




--Home Work

create table Class(
ClassCode varchar(10) primary key,
HeadTeacher varchar(30),
Room varchar(30),
TimeSlot char,
CloseDate datetime
)


insert into Class values
('C1007L','Nguyen Van An','Class 1','G','06-30-2022'),
('T2203M','Dang Kim Thi','Class 2','L','07-01-2022'),
('T2012M','Nguyen Van Luyen','Class 3','G','06-27-2022'),
('C9097L','Nguyen Van Tuan','Class 4','I','06-28-2022'),
('A2307L','Nguyen Van Kim','Class 5','M','06-29-2022')

create table Student(
RollNo varchar(10) primary key,
ClassCode varchar(10) foreign key references Class(ClassCode),
FullName Varchar(30),
Male bit,
BirthDate datetime,
Address varchar(30),
Provice char(3),
Email varchar(30)
)

insert into Student values
('A00264','T2203M','Nguyen Ba Quoc',1,'03-12-2001','Ha Noi','HN','quocquoc@gmail.com'),
('A00263','T2203M','Nguyen Dinh Hien',1,'03-12-1995','Hung Yen','HY','hienhien@gmail.com'),
('A00262','C1007L','Mai Xuan Tien',1,'03-12-1990','Ha Noi','HN','tientien@gmail.com'),
('A00261','A2307L','Nguyen Thanh Binh',1,'03-12-1997','Ha Noi','HN','binbin@gmail.com'),
('A00265','T2012M','Tong Minh Duong',1,'03-12-1996','Thanh Hoa','TH','duongduong@gmail.com')



create table Subjects(
SubjectCode  varchar(10) primary key,
SubjectName varchar(40),
WMark bit,
PMark bit,
WTest_per int,
PTest_per int
)

insert into Subjects values
('EPC','Logic C',1,0,1,2),
('CF','Logic HTML',1,1,1,2),
('Javal','Javal',1,0,1,2),
('PHP','PyThon',0,0,1,2),
('JS','Java Script',0,1,1,2)


Create table Mark(
RollNo varchar(10) foreign key references Student(RollNo),
SubjectCode varchar(10) foreign key references Subjects(SubjectCode),
WMark float,
PMark float,
Mark float
)


insert into Mark values 
('A00264','EPC',8,0,3.33),
('A00263','CF',8,6,6.67),
('A00262','Javal',7,0,2.33),
('A00261','PHP',0,0,0),
('A00265','JS',0,8,5.33)
insert into Mark values ('A00264','CF',8,6,6.67)

/*Tạo một khung nhìn chứa danh sách các sinh viên đã có ít nhất 2 bài thi (2 môn học khác nhau).*/
create view view_4_2
as
select s.FullName, count(SJ.SubjectCode) as CK
from Student s
inner join Mark M on s.RollNo=M.RollNo
inner join Subjects SJ on SJ.SubjectCode=M.SubjectCode
group by s.FullName
having COUNT(SJ.SubjectCode)>=2



--Tạo một khung nhìn chứa danh sách tất cả các sinh viên đã bị trượt ít nhất là một môn.

create view view_4_3
as
select s.FullName
from Student s
inner join Mark m on m.RollNo=s.RollNo and m.Mark <= 4

--Tạo một khung nhìn chứa danh sách các sinh viên đang học ở TimeSlot G.
create view view_4_4
as
select s.FullName
from Student s 
inner join Class C on C.ClassCode = s.ClassCode and C.TimeSlot='G'

--Tạo một khung nhìn chứa danh sách các giáo viên có ít nhất 3 học sinh thi trượt ở bất cứ môn nào.

create view  view_4_5
as
select C.HeadTeacher,count(distinct S.RollNo) as R
from Class C
inner join Student S on S.ClassCode=C.ClassCode
inner join Mark m on m.RollNo=s.RollNo 
where m.Mark <= 4
group by C.HeadTeacher
having count(distinct S.RollNo) >=3

/*Tạo một khung nhìn chứa danh sách các sinh viên thi trượt môn EPC của từng lớp. Khung nhìn
này phải chứa các cột: Tên sinh viên, Tên lớp, Tên Giáo viên, Điểm thi môn EPC.*/

create view view_4_6
as
select s.FullName,C.Room,C.HeadTeacher,m.Mark
from Class C
inner join Student s on C.ClassCode=s.ClassCode
inner join Mark m on m.RollNo=s.RollNo
inner join Subjects SJ on SJ.SubjectCode=m.SubjectCode 
and SJ.SubjectCode='EPC'
where m.Mark<=4




select * from view_4_6
select * from view_4_5
select * from view_4_4
select * from view_4_3
select * from view_4_2

