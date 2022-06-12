if exists (select * from sys.databases where name='ASM_5')
drop database ASM_5
go
create database ASM_5
go
use ASM_5
go
--Tạo bảng 
create table Contacts(
CustomerId varchar(15) primary key,
Name nvarchar(30) not null,
Address nvarchar(50) not null,
BOD date not null
)

create table Phone(
PhoneNumber varchar(15) primary key,
CustomerId varchar(15) CONSTRAINT fk_P FOREIGN KEY REFERENCES Contacts(CustomerId),
)

--Chèn thêm dữ liệu vào các bảng
insert into Contacts values('100',N'Nguyễn Văn An',N'111 Nguyễn Trãi,Thanh Xuân, Hà Nội','11-18-1987')
insert into Contacts values('101',N'Bìn Bìn',N'Hà Nam','11-18-1997')
insert into Contacts values('102',N'Mai Xuân Tiến',N'Thanh Hóa','11-18-1990')
insert into Contacts values('103',N'Nguyễn Bá Quốc',N'Hà Nội','11-18-2000')
insert into Contacts values('104',N'Tống Minh Dương',N'Thanh Hóa','11-18-1997')
insert into Contacts values('105',N'Tống Minh Danh',N'Thanh Hóa','12-18-1997')


insert into Phone values('987654321','100')
insert into Phone values('09873452','100')
insert into Phone values('09832323','100')
insert into Phone values('09434343','100')
insert into Phone values('037654322','101')
insert into Phone values('0387654323','101')
insert into Phone values('987654324','102')
insert into Phone values('987654325','102')
insert into Phone values('987654326','103')
insert into Phone values('987654327','103')
insert into Phone values('0987654328','104')
insert into Phone values('0987654329','104')
insert into Phone values('0987654310','104')
insert into Phone values('0987654330','103','')



--Liệt kê danh sách những người trong danh bạ
select Name from Contacts
--Liệt kê danh sách số điện thoại có trong danh bạ
select PhoneNumber from Phone

--Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
select Name from Contacts
order by Name asc
--Liệt kê các số điện thoại của người có thên là Nguyễn Văn An.
select Phone.PhoneNumber from Phone,Contacts
where Contacts.CustomerId = Phone.CustomerId  and Contacts.Name=N'Nguyễn Văn An'
--Liệt kê những người có ngày sinh là 12/12/09
select Name from Contacts
where BOD ='12-12-2009'
--Tìm số lượng số điện thoại của mỗi người trong danh bạ.
select Contacts.Name,count(Phone.CustomerId)
from Contacts,Phone
where Contacts.CustomerId = Phone.CustomerId 
group by Contacts.Name

--Tìm tổng số người trong danh bạ sinh vào thang 12
SELECT count(CustomerId)  from Contacts WHERE month(EOMONTH(BOD)) = 12

--Hiển thị toàn bộ thông tin về người, của từng số điện thoại.
select Phone.PhoneNumber,Contacts.Name,Contacts.Address,Contacts.BOD,Contacts.CustomerId from Phone,Contacts
where Contacts.CustomerId = Phone.CustomerId 
--Hiển thị toàn bộ thông tin về người, của số điện thoại 123456789(không có số này).
select Phone.PhoneNumber,Contacts.Name,Contacts.Address,Contacts.BOD,Contacts.CustomerId from Phone,Contacts
where Contacts.CustomerId = Phone.CustomerId and Phone.PhoneNumber='0987654310'

--Viết câu lệnh để thay đổi trường ngày sinh là trước ngày hiện tại.
alter table Contacts
add constraint CK_BOD Check (BOD <=getdate())
-- Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.


--Viết câu lệnh để thêm trường ngày bắt đầu liên lạc.
alter table Phone
add Connects date



select *from Phone
select* from Contacts