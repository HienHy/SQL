use master
go
if exists (select * from sys.databases where name='ASM_CGV')
drop database ASM_CGV
go
create database ASM_CGV
go
use ASM_CGV
go
--Bảng khách hàng
create table Customer(
CustomerId int identity(10,1) primary key,
Name Nvarchar(30) not null,
BOD date not null,
Address nvarchar(100),
PhoneNumber varchar(15) not null,
Email varchar(100)
)
go
--Thêm dữ liệu
insert into Customer values(N'Nguyễn Bá Quốc','01-10-2000',N'Hà Nội','0947171717','quocquoc@gmail.com')
insert into Customer values(N'Tống Minh Dương','01-10-2000',N'Thanh Hóa','0947171727','duongduong@gmail.com')
insert into Customer values(N'Nguyễn Thị Thúy','01-10-2000',N'Vĩnh Phúc','0947171737','thuythuy@gmail.com')
insert into Customer values(N'Nguyễn Trung Hiếu','01-10-2000',N'Hà Nội','0947171747','quocquoc@gmail.com')
insert into Customer values(N'Nguyễn Đình Hiến','01-10-2000',N'Hưng Yên','0947171757','hienhien@gmail.com')
go
--Tạo bảng đồ ăn
create table FoodAndDrink(
ProductId int identity(20,1) primary key,
Name nvarchar(50) not null,
Type_ int default 0 check(Type_ in(0,1)),--0 : drink ,1 : Food
Unit nvarchar(50),
Price money,
Qty nvarchar(50),
Status nvarchar(50),
)
go
--Thêm dữ liệu
insert into FoodAndDrink values(N'Cocacola',0,N'Cốc',10000,1000,N'Còn Hàng')
insert into FoodAndDrink values(N'Trà Sữa',0,N'Cốc',30000,1000,N'Còn Hàng')
insert into FoodAndDrink values(N'Pepsi',0,N'Cốc',10000,1000,N'Còn Hàng')
insert into FoodAndDrink values(N'Nước Ép',0,N'Cốc',20000,1000,N'Còn Hàng')
insert into FoodAndDrink values(N'Cà Phê',0,N'Cốc',15000,1000,N'Còn Hàng')
insert into FoodAndDrink values(N'Bỏng Ngô',1,N'Hộp',20000,1000,N'Còn Hàng')

go
--Tạo bảng order đồ ăn
create table Order_(
OrderId int identity(30,1) primary key,
CustomerId int constraint FK_CFood foreign key references Customer(CustomerId),
OrderDate date constraint CK_ORD Check (OrderDate>=getdate()),
Status nvarchar(50)
)
go

--Thêm dữ liệu
go
insert into Order_ values(10,'06-17-2022',N'Đã xuất kho')
insert into Order_ values(11,'06-18-2022',N'Đã xuất kho')
insert into Order_ values(12,'06-19-2022',N'Đã xuất kho')
insert into Order_ values(13,'06-20-2022',N'Đã xuất kho')
insert into Order_ values(14,'06-21-2022',N'Đã xuất kho')

go
--Chi tiết đơn hàng
create table OrderDetails(
OrderId int constraint FK_Food foreign key references Order_(OrderId),
ProductId int constraint FK_Product foreign key references FoodAndDrink(ProductId),
Price money,
Qty int,
)
go
--Thêm dữ liệu
insert into OrderDetails values(30,20,15000,1)
insert into OrderDetails values(30,21,35000,2)
insert into OrderDetails values(32,21,35000,3)
insert into OrderDetails values(32,25,25000,2)
insert into OrderDetails values(33,22,15000,10)

go
--Bảng loại phòng chiếu
create table RoomType(
RoomTypeID int identity(10,1) primary key,
RoomTypeName Nvarchar(30) not null,
Price money
)
go

--Thêm dữ liệu
insert into RoomType values(N'SWEETBOX',100000)
insert into RoomType values(N'4DX',500000)
insert into RoomType values(N'DOLBY ATMOS',150000)
insert into RoomType values(N'IMAX',120000)
insert into RoomType values(N'GOLDCLASS',130000)
insert into RoomType values(N'LAMOUR',140000)
insert into RoomType values(N'STARIUM',180000)
insert into RoomType values(N'PREMIUM CINEMA',200000)
insert into RoomType values(N'CINE&FORET',100000)
insert into RoomType values(N'CINE&LIVING ROOM',100000)

go
--Bảng Ngày
create table Time_(
Time_Id int identity(100,1) primary key,
Date_ date check (Date_>=getdate() and Date_ < (getdate() + 30)),
)
go
--Thêm dữ liệu
insert into Time_ values('06-17-2022')
insert into Time_ values('06-18-2022')
insert into Time_ values('06-19-2022')
insert into Time_ values('06-20-2022')
insert into Time_ values('06-21-2022')
insert into Time_ values('06-22-2022')
insert into Time_ values('06-23-2022')
insert into Time_ values('06-24-2022')
insert into Time_ values('06-25-2022')
go
--Tạo bảng khu vực
create table City(
CityId int identity primary key,
CityName NVarchar(30) unique not null,
Time_Id int foreign key references Time_(Time_Id)
)
go
--Thêm dữ liệu
insert into City values(N'Hồ Chí Minh',100)
insert into City values(N'Hà Nội',101)
insert into City values(N'Cà Mau',100)
insert into City values(N'Hưng Yên',102)
insert into City values(N'Bình Dương',102)
insert into City values(N'Đà Nẵng',100)
insert into City values(N'Thái Bình',100)
insert into City values(N'Nha Trang',103)
insert into City values(N'Vũng Tàu',105)
go
--Tạo bảng rạp
create table Cinema(
CinemaID int identity(50,1) primary key,
CinemaName Nvarchar(50) not null,
address Nvarchar(100) not null,
CityId int foreign key references City(CityId)
)
go
--Thêm dữ liệu
insert into Cinema values(N'CGV Hai Bà Trưng',N' Hai Bà Trưng',2)
insert into Cinema values(N'CGV Quận 2',N'Quận 2',1)
insert into Cinema values(N'CGV Mỹ Đình',N'Mỹ Đình',2)
insert into Cinema values(N'CGV Quận 3',N'Quận 3',1)
insert into Cinema values(N'CGV Hưng Yên',N'Hưng Yên',4)
insert into Cinema values(N'CGV Đà Nẵng',N'Đà Nẵng',5)
go
--Tạo bảng phong chiếu
create table Room(
RoomId int identity(10,1) primary key,
RoomName Nvarchar(50) unique not null,
CinemaID int foreign key references Cinema(CinemaID),
RoomTypeID int foreign key references RoomType(RoomTypeID)
)
go
--Thêm dữ liệu
insert into Room values(N'Phòng 1',50,10)
insert into Room values(N'Phòng 2',51,11)
insert into Room values(N'Phòng 3',50,12)
insert into Room values(N'Phòng 4',51,13)
insert into Room values(N'Phòng 5',52,14)

go
--Tạo bảng ghế
create table Chair(
ChairId int identity(10,1) primary key,
ChairName varchar(10) unique not null,
RoomId int foreign key references Room(RoomId)
)
go
--Thêm Dữ liệu
insert into Chair values ('A1',10)
insert into Chair values ('A2',10)
insert into Chair values ('A3',10)
insert into Chair values ('A4',10)
insert into Chair values ('A5',10)
insert into Chair values ('A6',10)
insert into Chair values ('A8',10)
insert into Chair values ('A7',10)
insert into Chair values ('A9',10)
insert into Chair values ('A10',10)
insert into Chair values ('A11',10)

go
--Tạo bảng xuất chiếu
create table Premiere(
PremiereId int identity(20,1) primary key,
StartTime time not null,
EndTime time not null
)
go
--Thêm dữ liệu
insert into Premiere values('20:30:00','22:00:00')
insert into Premiere values('19:30:00','21:00:00')
insert into Premiere values('20:30:00','22:00:00')
insert into Premiere values('21:30:00','22:00:00')
insert into Premiere values('18:30:00','21:00:00')
insert into Premiere values('16:30:00','18:00:00')
insert into Premiere values('14:30:00','16:00:00')
insert into Premiere values('12:30:00','14:00:00')

go

--Tạo bảng Ghế của xuất chiếu
create table ChairOfPremiere(
ChairOfPremiereId int identity(10,1) primary key,
ChairId int foreign key references Chair(ChairId),
PremiereId int foreign key references Premiere(PremiereId)
)
go
insert into ChairOfPremiere values(10,21)
insert into ChairOfPremiere values(11,21)
insert into ChairOfPremiere values(12,21)
insert into ChairOfPremiere values(13,21)
insert into ChairOfPremiere values(14,21)
insert into ChairOfPremiere values(15,21)
insert into ChairOfPremiere values(16,21)
insert into ChairOfPremiere values(17,21)

go


--Bảng thể loại phim
create table MovieGenre(
MovieGenreID varchar(20) primary key,
MovieGenreName Nvarchar(100) not null
)
go
--Thêm dữ liệu
insert into MovieGenre values('LP01',N'Kinh Dị')
insert into MovieGenre values('LP02',N'Tình Cảm')
insert into MovieGenre values('LP03',N'Phưu Lưu')
insert into MovieGenre values('LP04',N'Lịch Sử')
insert into MovieGenre values('LP05',N'Khoa Học Viễn Tưởng')

go
--Tạo bảng Phim
create table Film(
FilmId int identity(10,1) primary key,
FilmName Nvarchar(100) not null,
Director Nvarchar(100) not null,
MovieGenreID varchar(20) foreign key references MovieGenre(MovieGenreID),
ChairOfPremiereId int foreign key references ChairOfPremiere(ChairOfPremiereId),
ReleaseDate date not null,
language_ Nvarchar(100) not null,
AgeLimit int default 0 check(AgeLimit in(0,1,2)),--0:Cho mọi lứa tuổi, 1:Cấm khán giả dưới 13 tuổi, 2:Cấm khán giả dưới 18 tuổi
Format int default 0 check(Format in (0,1,2)), -- 0: 2D, 1: 3D, 2: ĐEN TRẮNG
)


go
insert into Film values(N'Trịnh và EM',N'Phan Gia Nhật Linh','LP01',10,'06-17-2022',N'Tiếng Việt - Phụ đề Tiếng Anh',1,2) 
insert into Film values(N'Thế giới khủng long: Lãnh địa',N'Colin Trevorrow','LP02',11,'06-10-2022',N'Tiếng Anh - Phụ đề Tiếng Việt',2,1) 
insert into Film values(N'TRỊNH CÔNG SƠN',N' Phan Gia Nhật Linh','LP01',12,'06-17-2022',N'Tiếng Việt - Phụ đề Tiếng Anh',1,2)
insert into Film values(N'PHI CÔNG SIÊU ĐẲNG MAVERICK',N' Joseph Kosinski','LP04',13,'05-27-2022',N'Tiếng Anh - Phụ đề Tiếng Việt',0,2) 
insert into Film values(N'HARRY POTTER VÀ CĂN PHÒNG BÍ MẬT',N'Chris Columbus','LP04',10,'06-13-2022',N'Tiếng Anh - Phụ đề Tiếng Việt',0,1) 
insert into Film values(N'DORAEMON: NOBITA VÀ CUỘC CHIẾN VŨ TRỤ TÍ HON 2021',N'Yamaguchi Susumu','LP04',11,'05-27-2022',N'Tiếng Nhật - Phụ đề Tiếng Việt; Lồng tiếng',0,1) 


go
--Tạo bảng vé 
create table Ticket(
TicketId int identity(100,1) primary key,
OrderId int constraint FK_Oder foreign key references Order_(OrderId),
CustomerId int constraint FK_Cus foreign key references Customer(CustomerId),
TicketSaleDate date not null

)
go
insert into Ticket values(30,10,'06-10-2022')
insert into Ticket values(31,11,'06-16-2022')
insert into Ticket values(32,12,'06-17-2022')
insert into Ticket values(33,13,'06-18-2022')
insert into Ticket values(34,10,'06-20-2022')
go

--Tạo bảng Thông tin vé
create table TicketInformation(
TicketFormationID int identity(10,1) primary key,
TicketId int constraint FK_TI foreign key references Ticket(TicketId),
FilmId int constraint FK_F foreign key references Film(FilmId),
TicketReleaseDate date constraint CK_BOD Check (TicketReleaseDate>=getdate())
)

go
insert into TicketInformation values(100,11,'06-17-2022')
insert into TicketInformation values(101,12,'06-18-2022')
insert into TicketInformation values(102,13,'06-19-2022')
insert into TicketInformation values(103,11,'06-20-2022')
insert into TicketInformation values(104,12,'06-20-2022')


