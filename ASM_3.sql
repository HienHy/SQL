if exists (select * from sys.databases where name='ASM_3')
drop database ASM_3
go
create database ASM_3
go
use ASM_3
go
--Tạo bảng khách hàng
Create table Customer(
CustomerID int primary key,
Name nvarchar(50) not null,
CardID varchar(15) unique not null,
Address nvarchar(100) not null,
)
go

--Tạo bảng loại thuê bao 
create table PhoneDetails(
TypeID int primary key,
Name nvarchar(30) unique not null,
Describe nvarchar(30),
Price money,
)


go
--Tạo bảng thuê bao
create table Subscriber(
SubscriberID int unique not null,
PhoneNumber varchar(15) primary key,
CustomerID int CONSTRAINT fk FOREIGN KEY REFERENCES Customer(CustomerID),
TypeID int CONSTRAINT fk_T FOREIGN KEY REFERENCES PhoneDetails(TypeID),
RegistrationDate date not null,
ExpirationDate date not null,
Status varchar(50) not null,
)
--Thêm dữ liệu
insert into Customer values(1,N'Nguyễn Nguyệt Nga','123456789',N'Hà Nội')
insert into Customer values(2,N'Nguyễn Bá Quốc','90909090',N'Hà Nội')
insert into Customer values(3,N'Tống Minh Dương','90808080',N'Thanh Hóa')


insert into PhoneDetails values(10,N'Trả Trước',N'Thanh toán trước',100000)
insert into PhoneDetails values(11,N'Trả Sau',N'Thanh toán sau',150000)

insert into Subscriber values(100,'0123456789',1,10,'12-12-2002','01-12-2003','Drop')
insert into Subscriber values(101,'098988999',1,11,'12-12-2002','01-12-2003','Drop')
insert into Subscriber values(102,'098900000',2,10,'12-12-2020','01-12-2021','Active')
insert into Subscriber values(103,'099919191',3,11,'12-12-2020','01-12-2021','Active')
insert into Subscriber values(104,'099919111',3,11,'12-12-2009','01-12-2021','Active')

--Hiển thị toàn bộ thông tin của các khách hàng của công ty.
select * from Customer
--Hiển thị toàn bộ thông tin của các số thuê bao của công ty.
select * from Subscriber
--Hiển thị toàn bộ thông tin của thuê bao có số: 0123456789

select Customer.Name,Customer.Address,PhoneDetails.Name,PhoneDetails.Describe from Subscriber,Customer,PhoneDetails
where Customer.CustomerID=Subscriber.CustomerID and PhoneDetails.TypeID=Subscriber.TypeID and
PhoneNumber='0123456789'

--Hiển thị thông tin về khách hàng có số CMTND: 123456789
select * from Customer
where CardID=123456789
--Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
select Subscriber.PhoneNumber from Subscriber,Customer
Where Customer.CardID=123456789 and Customer.CustomerID= Subscriber.CustomerID

--Liệt kê các thuê bao đăng ký vào ngày 12/12/09
select Subscriber.PhoneNumber from Subscriber
where RegistrationDate ='12-12-2009'
--Liệt kê các thuê bao có địa chỉ tại Hà Nội
select Subscriber.PhoneNumber from Subscriber,Customer
Where Customer.Address=N'Hà Nội' and Subscriber.CustomerID =Customer.CustomerID
--Tổng số khách hàng của công ty.
select count (distinct CustomerID) from Customer

--Tổng số thuê bao của công ty.
select count (distinct SubscriberID) from Subscriber

--Tổng số thuê bào đăng ký ngày 12/12/09.
select count (distinct SubscriberID) from Subscriber
where RegistrationDate ='12-12-2009'

-- Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.
select Customer.Name,Customer.CardID,Customer.Address,Subscriber.PhoneNumber,Subscriber.RegistrationDate,Subscriber.ExpirationDate from Subscriber,Customer
Where Customer.CustomerID= Subscriber.CustomerID

--Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
alter table Subscriber
alter column RegistrationDate date not null

--Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại.
alter table Subscriber
add constraint CK_date Check (RegistrationDate <= getdate())

--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09
alter table Subscriber
add constraint CK_Tell Check (Tell like '09%')

--Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.

alter table Subscriber
add Bonus int







select * from PhoneDetails
select * from Subscriber
select * from Customer