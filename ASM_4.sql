if exists (select * from sys.databases where name='ASM_4')
drop database ASM_4
go
create database ASM_4
go
use ASM_4
go
--Tạo bảng Nhân viên
create table Staff(
StaffID varchar(40) primary key,
Name nvarchar(30) not null,

)
go

--Tạo bảng loại sản phẩm
create table ProductType(
ProductTypeID varchar(50) primary key,
Name nvarchar(30)  unique not null,


)
go
--Tạo bảng sản phẩm
create table Product(
ProductID varchar(40) primary key,
Name nvarchar(40) not null,
StaffID varchar(40) CONSTRAINT fk FOREIGN KEY REFERENCES Staff(StaffID),
ProductTypeID varchar(50) CONSTRAINT fk_Type FOREIGN KEY REFERENCES ProductType(ProductTypeID),
DateOfManufacture date not null,
)
go
insert into Product values('Z37 111111',N'Máy tính sách tayZ37','987688','Z37E','12-12-2009')
insert into Product values('G37 222222',N'Máy Giặt G37','987688','G37E','12-12-2009')
insert into Product values('I37 333333',N'Máy inI37','987689','I37E','12-12-2019')
insert into Product values('P37 444444',N'Máy pha cà phêP37','987687','P37E','12-12-2020')
insert into Product values('H37 555555',N'Máy Hút Bụi H37','987686','H37E','12-12-2021')
insert into Product values('H37 655555',N'Máy Hút Bụi H36','987685','H37E','12-12-2021')

insert into Staff values('987688',N'Nguyễn Văn An')
insert into Staff values('987689',N'Nguyễn Bá Quốc')
insert into Staff values('987687',N'Mai Xuân Tiến')
insert into Staff values('987686',N'Tống Minh Dương')
insert into Staff values('987685',N'Lê Thanh Bình')


insert into ProductType values('Z37E',N'Máy Tính')
insert into ProductType values('G37E',N'Máy Giặt')
insert into ProductType values('I37E',N'Máy In')
insert into ProductType values('P37E',N'Máy Pha Cà Phê')
insert into ProductType values('H37E',N'Máy Hút Bụi')

--Liệt kê danh sách loại sản phẩm của công ty.
select* From ProductType
--Liệt kê danh sách sản phẩm của công ty.
select * from Product
--Liệt kê danh sách người chịu trách nhiệm của công ty.
select* From Staff

--Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
select Name from Product
order by Name asc

--Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
select Name from Staff
order by Name asc
--Liệt kê các sản phẩm của loại sản phẩm có mã số là Z37E.
select Name From Product
where ProductTypeID='Z37E'
--Liệt kê các sản phẩm Nguyễn Văn An chịu trách nhiệm theo thứ tự giảm đần của mã.
select ProductID from Product
where StaffID='987688'
order by ProductID desc
--Số sản phẩm của từng loại sản phẩm.
SELECT  pd.Name ,COUNT (p.ProductID)
FROM Product AS p, ProductType AS pd 
WHERE p.ProductTypeID = pd.ProductTypeID
GROUP BY pd.Name


--Số loại sản phẩm trung bình theo loại sản phẩm.
select 
	count(p.ProductID) p_count, 
	pt.pt_count, 
	(convert(float, count(p.ProductID)) / pt.pt_count) avg_pt_of_p 
from 
	Product p, 
	(select convert(float, count(ProductTypeID)) as pt_count from ProductType) pt 
group by 
	pt.pt_count




--Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm.
SELECT pt.Name, p.Name
FROM ProductType AS pt, Product AS p 
WHERE p.ProductTypeID = pt.ProductTypeID
--Hiển thị toàn bộ thông tin về người chịu trách nhiêm, loại sản phẩm và sản phẩm.
SELECT s.Name, pt.Name, p.Name
FROM Staff AS s, ProductType AS pt, Product AS p 
WHERE s.StaffID = p.StaffID AND p.ProductTypeID = pt.ProductTypeID

--Viết câu lệnh để thay đổi trường ngày sản xuất là trước hoặc bằng ngày hiện tại.
alter table Product
add constraint CK_date Check (DateOfManufacture <= getdate())

--Viết câu lệnh để thêm trường phiên bản của sản phẩm.
alter table Product
add Version varchar(30)

select * from Product
select* From ProductType
select* From Staff