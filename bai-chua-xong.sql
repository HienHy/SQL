IF EXISTS (SELECT * FROM sys.databases WHERE name='Example5')
DROP DATABASE Example5
GO 
CREATE DATABASE Example5
GO
USE Example5
GO
--Tao bang lop hoc--
CREATE TABLE LopHoc(
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10)
)
GO
--tao bang sinh vien co khoa ngoai la cot malophoc, noi voi bang lop hoc--
CREATE TABLE SinhVien(
MaSV int PRIMARY KEY ,
TenSv varchar(40),
MaLopHoc int,
CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO
--tao bang san pham voi cot null, mot cot not null--
CREATE TABLE SanPham(
MaSP int NOT NULL,
TenSP varchar(40) NULL
)
GO
select MaSP from SanPham

Go

--tao bang voi thuoc tinh default cho cot price--
CREATE TABLE StoreProduct(
ProductID int NOT NULL,
Name varchar(40) NOT NULL,
Price money NOT NULL DEFAULT (100)
)
--THU KIEM TRA GIA TRI DEFAULT CO DUOC SU DUNG HAY KO--
INSERT INTO StoreProduct(ProductID,Name) VALUES (111, Rivets)
GO
--TAO BANG CONTACTPHONE VOI THUOC TINH IDENTITY--
CREATE TABLE ContactPhone (
Person_ID int IDENTITY(500,1) NOT NULL,
MobileNumber bigint NOT NULL
)
--tao cot nhan dang duy nhat tong the--
CREATE TABLE CellularPhone(
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)
--chen mot record vao--
INSERT INTO CellularPhone(PersonName) VALUES ('William Smith')
GO
--kiem tra gia tri cua cot person_id tu dong sinh--
SELECT * FROM CellularPhone
GO
--Tao bang contactphone voi cot mobilenumber co thuoc tinh unique--
CREATE TABLE ContactPhone (
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE,
)
--CHEN 2 BAN GHI CO GIA TRI GIONG NHAU O COT MOBILENUMBER VA LANLIENUMBER DE QUAN SAT LOI--
INSERT INTO ContactPhone values (101,983345674, 'Hutch',NULL)
INSERT INTO ContactPhone values (102,983345674, 'Alex',NULL)
GO

--tao bang phoneexpenses co mot chect o cot amount--
CREATE TABLE PhoneExpenses(
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
(MobileNumber),
Amount bigint CHECK (Amount >0)
)





select Person_ID  From ContactPhone