if exists (select * from sys.databases where name='Taks_05')
drop database Taks_05
go
create database Taks_05
go
use Taks_05
go
--đơn hàng
create table Order_(
OrderId int primary key,
CustomerID int,
OrderDate date,
Status nvarchar(50)
)
go

select * from Order_
go
--thông tin khách hàng--
create table Customer(
CustomerID int primary key,
Name nvarchar(50),
Address nvarchar(100),
Tell bigint,
Status nvarchar(50),
)
go

select * from Customer
go
--thông tin chi tiết đơn hàng
create table OrderDetails(
OrderId int ,
ProductID int,
Price money,
Qty int,
)
go
select * from OrderDetails
go
--thông tin sản phẩm
create table Product(
ProductID int primary key,
Name nvarchar(50),
Description nvarchar(100),
Unit nvarchar(50),
Price money,
Qty nvarchar(50),
Status nvarchar(50),
)
go
select * from Product
go
--tạo dằng buộc cho các cột
alter table OrderDetails
add constraint fk foreign key (ProductID)references Product(ProductID)
go
alter table OrderDetails
add constraint fk_od foreign key (OrderId)references Order_(OrderId)
go

alter table Order_
add constraint fk_odc foreign key (CustomerID)references  Customer(CustomerID)
go
--thêm dữ liệu
insert into Product values(100,N'Máy Tính T450',N'Máy nhập mới',N'Chiếc',1000,10,N'Còn Hàng')
insert into Product values(101,N'Điện Thoại Nokia5670',N'Điện thoại đang hot',N'Chiếc',200,10,N'Còn Hàng')
insert into Product values(102,N'Máy in Samsung450',N'Máy in đang ế',N'Chiếc',100,10,N'Còn Hàng')

go
insert into Customer values(200,N'Nguyễn Văn An',N'111 Nguyễn Trãi,Thanh Xuân,Hà Nội',987654321,'vip')
insert into Customer values(201,N'Mai Xuân Tiến',N'Đội Nhân,Ba Đình,Hà Nội',988362662,N'Kim Cương Đen')
insert into Customer values(202,N'Dương Minh',N'Thanh Hóa',374148897,N'Bạch Kim')
insert into Customer values(203,N'Bìn Bìn',N'Hà Nội',358068120,N'Bạch Kim')

go
insert into Order_ values(300,203,'06-06-2022',N'Đang Vận Chuyển')
insert into Order_ values(301,202,'05-06-2022',N'Đang Trong Kho')
insert into Order_ values(302,201,'11-10-2021',N'Đã Chuyển')
insert into Order_ values(303,200,'11-18-2009',N'Đã Chuyển')
insert into Order_ values(304,200,'11-18-2009',N'Đã Chuyển')
go
insert into OrderDetails values(303,100,1000,1)
insert into OrderDetails values(303,101,200,2)
insert into OrderDetails values(303,102,100,1)
go
insert into OrderDetails values(302,102,1000,2)
insert into OrderDetails values(302,101,200,1)
insert into OrderDetails values(302,100,100,2)
go
insert into OrderDetails values(301,101,1000,3)
insert into OrderDetails values(301,100,200,1)
insert into OrderDetails values(301,102,100,3)
go

--liệt kê danh sách khách hàng đã mua ở cửa hàng
select Name from Customer
--Liệt kê danh sách sản phẩm của của hàng
select Name from Product
--Liệt kê danh sách các đơn đặt hàng của cửa hàng.
select OrderId from Order_
go
--Liệt kê danh sách khách hàng theo thứ thự alphabet.
select Name from Customer
order by Name asc
--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
select Price from Product
order by Price desc
--Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua.
select Product.Name,Customer.Name
from OrderDetails,Order_,Customer,Product 
where Customer.CustomerID=200 
and OrderDetails.ProductID = Product.ProductID 
and OrderDetails.OrderId = Order_.OrderId 
and Order_.CustomerID = Customer.CustomerID


go
--Số khách hàng đã mua ở cửa hàng.
select COUNT (distinct CustomerID) from Order_
--Số mặt hàng mà cửa hàng bán.
select COUNT (distinct ProductID) from Product
--Tổng tiền của từng đơn hàng.
select SUM(Price*Qty) from OrderDetails
where OrderId=303
select SUM(Price*Qty) from OrderDetails
where OrderId=302
select SUM(Price*Qty) from OrderDetails
where OrderId=301

go
--Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
alter table Product
add constraint CK_Gia Check (Price >0)


--Viết câu lệnh để thay đổi ngày đặt hàng của khách hàng phải nhỏ hơn ngày hiện tại.
alter table Order_
add constraint CK_date Check (OrderDate < getdate())

--Viết câu lệnh để thêm trường ngày xuất hiện trên thị trường của sản phẩm.
alter table Product
add AppearanceDate date

/*Đặt chỉ mục (index) cho cột Tên hàng và Người đặt hàng để tăng tốc độ truy vấn dữ liệu trên
các cột này.*/
create index Product_Name
on Product(Name)
go

create index Customer_Name
on Customer(Name)

--View_KhachHang với các cột: Tên khách hàng, Địa chỉ, Điện thoại
create view View_KhachHang
as
select C.Name,C.Address,C.Tell
from Customer C 


--View_SanPham với các cột: Tên sản phẩm, Giá bán
create view View_SanPham
as
select P.Name,P.Price
from Product P 
--View_KhachHang_SanPham với các cột:
create view View_KhachHang_SanPham
as
select C.Name,C.Tell,P.Name as ProductName,P.Qty,O.OrderDate
from Customer C
inner join Order_ O on O.CustomerID=C.CustomerID
inner join OrderDetails OD on O.OrderId=OD.OrderId
inner join Product P on OD.ProductID=P.ProductID

--SP_TimKH_MaKH: Tìm khách hàng theo mã khách hàng

create procedure sp_displayCustomer
@CustomerID int
as
select C.Name from Customer C
where C.CustomerID=@CustomerID


execute sp_displayCustomer 201


--SP_TimKH_MaHD: Tìm thông tin khách hàng theo mã hóa đơn

create procedure SP_TimKH_MaHD
@OrderId int
as
select C.Name,C.Address,C.Tell from Customer C
inner join Order_ O on O.CustomerID=C.CustomerID and O.OrderId=@OrderId


execute SP_TimKH_MaHD 300


/*SP_SanPham_MaKH: Liệt kê các sản phẩm được mua bởi khách hàng có mã được
truyền vào Store.*/

create procedure SP_SanPham_MaKH
@CustomerID int
as
select p.Name,C.name
from Product p 
inner join OrderDetails od on od.ProductID=p.ProductID
inner join Order_ O on o.OrderId = od.OrderId 
inner join Customer C on C.CustomerID=O.CustomerID where O.CustomerID=@CustomerID
 


 execute SP_SanPham_MaKH 201








select * from OrderDetails
select * from Order_
select * from Customer
select * from Product
select* from View_KhachHang