if exists (select * from sys.databases where name='ASM_2')
drop database ASM_2
go
create database ASM_2
go
use ASM_2
go
--tạo bảng công ty
create table Company(
CompanyId int primary key,
Name varchar(50) not null,
Addrees varchar(100) not null,
Tell varchar(15) unique not null ,
)
go
--tạo bảng sản phẩm
create table Product(
ProductId int primary key,
CompanyId int,
CONSTRAINT fk FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId),
Name varchar(50) not null,
Description varchar(50),
Unit varchar(15) not null,
Price money not null,
Qty int,
)
go
insert into Company values(123,'Asus','USA','0983232')
insert into Company values(124,'SamgSung','Korea','0983222')
insert into Company values(125,'Apple','USA','0983242')
go

insert into Product values(200,123,'T450 Coputer','Old input machine','Psc',1000,10)
insert into Product values(201,123,'Nokia5670','Hot','Psc',200,200)
insert into Product values(202,123,'Samsung 450','Medium','Psc',100,10)


insert into Product values(203,124,'Galaxy note3','Old input machine','Psc',200,10)
insert into Product values(204,124,'S22 ultra','Hot','Psc',500,200)
insert into Product values(205,124,'Note 20','Medium','Psc',800,10)



insert into Product values(206,125,'Iphone 11pro','Old input machine','Psc',600,30)
insert into Product values(207,125,'Iphone 13pro max','Hot','Psc',1400,200)
insert into Product values(208,125,'Ipad 11pro','Medium','Psc',1200,100)
insert into Product values(209,125,'Ipad 12pro','Medium','Psc',1200,0)

-- Hiển thị tất cả các hãng sản xuất.
select Name from Company
-- Hiển thị tất cả các sản phẩm.
select Name from Product
-- Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên.

select Name from Company
order by Name desc
--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
select Price from Product
order by Price desc

-- Hiển thị thông tin của hãng Asus.

select * from Company
where Name='Asus'

--Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho

select * from Product
where Qty<11

--Liệt kê danh sách sản phẩm của hãng Asus
select Product.Name,Company.Name from Product,Company
where Product.CompanyId=Company.CompanyId and Company.Name='Asus'

--Số hãng sản phẩm mà cửa hàng có.
select COUNT (distinct CompanyId) from Company
--Số mặt hàng mà cửa hàng bán.
select COUNT (distinct ProductId ) from Product
--Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
SELECT  p.CompanyId ,COUNT (distinct p.ProductID )as SoLoai
FROM Product AS p, Company AS c 
WHERE p.CompanyId = C.CompanyId
GROUP BY  p.CompanyId 

--Tổng số đầu sản phẩm của toàn cửa hàng
select SUM(Qty) from Product

--Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
alter table Product
add constraint CK_Gia Check (Price >0)
--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.
alter table Company
add constraint CK_Tell Check (Tell like '0%')


/*Đặt chỉ mục (index) cho cột Tên hàng và Người đặt hàng để tăng tốc độ truy vấn dữ liệu trên
các cột này*/
create index Product_Name
on Product(Name)


create index Description_Product
on Product(Description)


--View_SanPham: với các cột Mã sản phẩm, Tên sản phẩm, Giá bán
create view View_SanPham
as
select P.ProductId,P.Name,P.Price
from Product P

--View_SanPham_Hang: với các cột Mã SP, Tên sản phẩm, Hãng sản xuất
create view View_SanPham_Hang
as 
select p.ProductId,p.Name,C.CompanyId
from Product p
inner join Company C on p.CompanyId=C.CompanyId


/* SP_SanPham_TenHang: Liệt kê các sản phẩm với tên hãng truyền vào store */
create Procedure SP_SanPham_TenHang
@Name varchar(50) 
as
select p.Name
from Product p
inner join Company C on C.CompanyId=p.CompanyId and C.Name=@Name

execute SP_SanPham_TenHang 'Apple'
/*SP_SanPham_Gia: Liệt kê các sản phẩm có giá bán lớn hơn hoặc bằng giá bán truyền
vào*/

create Procedure SP_SanPham_Gia
@Price money 
as
select p.Name
from Product p where p.Price >=@Price



drop Procedure SP_SanPham_Gia
execute SP_SanPham_Gia 1000
/* SP_SanPham_HetHang: Liệt kê các sản phẩm đã hết hàng (số lượng = 0)*/

create Procedure SP_SanPham_HetHang
@Qty int = 0 
as
select p.Name,p.Qty
from Product p where p.Qty=@Qty


execute SP_SanPham_HetHang 








select *from Company
select *from Product
