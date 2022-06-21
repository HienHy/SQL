create database Aptech

--Tạo cơ sở dữ liệu tên là Aptech, trong đó tạo bảng Classes với cấu trúc như sau:
create table Classes (
ClassName char(6),
Teacher varchar(30),
TimeSlot varchar(30),
Class int,
Lab int

)
--Tạo an unique, clustered index tên là MyClusteredIndex trên trường ClassName với thuộc tính sau:
create unique clustered index MyClusteredIndex
on Classes(ClassName)
with
(FillFactor =70,Pad_index=on,Ignore_Dup_Key=on)

--Tạo a nonclustered index tên là TeacherIndex trên trường Teacher
create nonclustered index TeacherIndex
on Classes(Teacher)
--Xóa chỉ mục TeacherIndex
drop index TeacherIndex
on Classes

--Tạo lại MyClusteredIndexvới các thuộc tính sau:
create unique clustered index MyClusteredIndex
on Classes(ClassName)
with(
ALLOW_PAGE_LOCKS= ON, MAXDOP = 2,DROP_EXISTING=on,ALLOW_ROW_LOCKS=on)

--Tạo một composite index tên là ClassLabIndex trên 2 trường Class và Lab.

create index ClassLabIndex
on Classes(Class,Lab)


--Viết câu lệnh xem toàn bộ các chỉ mục của cơ sở dữ liệu Aptech.
EXEC sp_helpindex 'Classes'