if exists (select * from sys.databases where name='Taks_05')
drop database Taks_05
go
create database Taks_05

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
OrderId int primary key,
ProductID int,
Price money,
Qty nvarchar(50),
)
go
alter table OrderDetails
drop PK__OrderDet__C3905BCFBB21DF62 

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
insert into Order_ values(300,203,'07-06-2022',N'Đang Vận Chuyển')
insert into Order_ values(301,202,'05-06-2022',N'Đang Trong Kho')
insert into Order_ values(302,201,'11-10-2021',N'Đã Chuyển')
insert into Order_ values(303,200,'11-18-2009',N'Đã Chuyển')
insert into Order_ values(304,200,'11-18-2009',N'Đã Chuyển')


go
insert into OrderDetails values(303,100,1000,N'1 Chiếc')
insert into OrderDetails values(303,101,200,N'2 Chiếc')
insert into OrderDetails values(303,102,100,N'1 Chiếc')
