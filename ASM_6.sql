if exists (select * from sys.databases where name='ASM_6')
drop database ASM_6
go
create database ASM_6
go
use ASM_6
go

create table BookType(
BookTypeId int identity primary key,
BookTypeName varchar(30)
)
insert into BookType values
('Khoa Hoc Xa Hoi'),
('Toan Hoc'),
('Tin Hoc'),
('Chinh Tri-Phap Luat'),
('Van Hoc Nghe Thuat'),
('Giao Trinh'),
('Truyen,Tieu Thuyet'),
('Thieu Nhi')



create table Company(
CompanyId int identity primary key,
CompanyName varchar(30),
Address varchar(40),
PhoneNumber varchar(15)

)

insert into Company values
('Chinh Tri Quoc Gia','Cau Giay - Ha Noi','02438221581'),
('Tu Phap','Cau Giay - Ha Noi','02437676744'),
('Hong Duc','Tay Ho - Ha Noi','0989181299'),
('Quan Doi','Hoan Kiem - Ha Noi','02437470780'),
('Cong An Nhan Dan','Hai Ba Trung - Ha Noi','0910200113'),
('Kim Dong','Hai Ba Trung - Ha Noi','02439434730'),
('Thanh Nien','Hoan Kiem - Ha Noi','0904558369'),
('Lao Dong','Dong Da-Ha Noi','02438515380'),
('Tri Thuc','Hai Ba Trung - Ha Noi','0912191928')


create table Book(
BookId varchar(15) primary key,
BookName nvarchar(50) not null,
BookTypeId int foreign key references BookType(BookTypeId),
CompanyId int foreign key references Company(CompanyId),
Author varchar(40),
Editions int,
PublishingYear date,
price money,
Qty int,
SummaryContent nvarchar(1000)
)


insert into Book values
('B001',N'Trí Tuệ Người Do Thái',1,9,'Eran Katz',1,'09-21-2010',79000,100,N'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì và nguồn gốc
trí tuệ của họ xuất phát từ đâu không? Cuốn sách này sẽ dần hé lộ
những bí ẩn về sự thông thái của người Do Thái, của một dân tộc
thông tuệ với những phương pháp và kỹ thuật phát triển tầng lớp trí
thức đã được giữ kín hàng nghìn năm như một bí ẩn mật mang tính
văn hóa'),
('B002',N'Đắc nhân tâm',1,5,'Dale Carnegie',1,'08-20-2011',100000,100,N'Có một sự thật là tất cả những người bạn gặp đều tự cảm thấy họ hơn bạn theo một cách nào đấy, và con đường thẳng dẫn tới trái tim họ là để họ nhận ra rằng bạn công nhận tầm quan trọng của họ, và sự ghi nhận đó là chân thành'),
('B003',N'Cách nghĩ để thành công',2,3,'Napoleon Hill',1,'07-12-2009',90000,100,N'Những đột phá cần có trong cuộc đời đang nằm trong chính trí tưởng tượng của bạn. Trí tưởng tượng là xưởng máy trong đầu bạn, có thể biến năng lượng tư duy thành thành tựu và của cải'),
('B004',N'7 thói quen của người thành đạt',2,3,'Steven Covey',1,'05-21-2012',99000,100,N'Gieo mầm suy nghĩ sẽ gặt hái hành vi, gieo mầm hành vi sẽ gặt hái thói quen, gieo mầm thói quen sẽ gặt hái tính cách, gieo mầm tính cách sẽ gặt hái số phận'),
('B005',N'Cuộc sống không giới hạn',3,2,'Nick Vujic',1,'09-11-2013',109000,100,N'Bạn đẹp đẽ và quý giá hơn tất cả những viên kim cương trên thế gian này. Dẫu vậy, chúng ta nên luôn luôn đặt ra cho mình mục tiêu trở thành những con người tốt hơn, toàn thiện hơn, đẩy lùi và loại bỏ những giới hạn bằng cách mơ những giấc mơ lớn lao. Trong hành trình đó, chúng ta luôn cần có những điều chỉnh (bởi vì cuộc đời này không phải lúc nào cũng toàn là màu hồng), nhưng cuộc đời này luôn đáng sống. Tôi đến đây để nói với bạn rằng cho dù bạn đang ở trong hoàn cảnh nào, miễn là bạn còn thở, thì bạn vẫn có thể đóng góp cho cuộc đời này'),
('B006',N'Hành trình về Phương Đông',3,1,'Blair T. Spalding',1,'01-21-2000',179000,100,N'Mọi vật trong vũ trụ đều quân bình tuyệt đối, không dư, không thiếu, từ hạt bụi bé nhỏ đến những dãy thiên hà vĩ đại. Đời người quá ngắn, và luôn bị lôi cuốn vào sinh hoạt quay cuồng. Đâu mấy ai ý thức được sự phung phí hôm nay, dọn đường cho sự đau khổ ngày mai. Tất cả chỉ là những ảo ảnh chập chờn, thế mà người ta cứ coi như thật. Nếu biết thức tỉnh quan sát, ta có thể học hỏi biết bao điều hay. Tiếc rằng khi đắc thời người ta quên đi quá khứ rất nhanh. Chỉ trong đau khổ, nhục nhã ê chề mới chịu học. Có thể đó cũng là lý do luôn luôn có các biến động vô thường, thúc dục con người học hỏi'),
('B007',N'Người giàu có nhất thành Babylon',4,5,'George Samuel Clason',1,'09-01-2001',279000,100,N'Cuốn sách nói về những thành công, những thành quả đạt được của từng cá nhân sống trong thành Babylon cổ đại. Từ đó, giúp mọi người hiểu rõ hơn về vấn đề tài chính và cống hiến các kế sách và phương pháp làm giàu. Những bí quyết này giúp bạn đánh giá đúng giá trị của đồng tiền, và hướng dẫn bạn cách thực hành theo những nguyên lý tài chính'),
('B008',N'Quẳng gánh lo đi mà vui sống',4,6,'Dale Carnegie',1,'01-04-1990',99000,100,N'Mang đến cho bạn sự tự tin, niềm vui, cách vượt lên những nỗi đau'),
('B009',N'Bộ sách – Hạt giống tâm hồn',4,2,'Nhieu Tac Gia',1,'01-02-2017',109000,100,N'Bộ sách Hạt giống tâm hồn là tập hợp những câu truyện hay trong cuộc sống. Những câu truyện thành đạt, những câu truyện về tấm lòng cao đẹp. Nuôi dưỡng một tâm hồn trong sáng, cho bạn một cuộc sống luôn vui tươi với những hạnh phúc giản dị.'),
('B010',N'Tốc độ của niềm tin',5,8,'Stephen M.R.Covey - Rebecca R.Merrill.',1,'09-15-2007',89000,100,N'Như những sóng gợn trong hồ nước, Tốc độ của Niềm tin bắt đầu từ bên trong mỗi con người chúng ta, rồi lan sang các mối quan hệ của chúng ta, các tổ chức nơi chúng ta hoạt động, các mối quan hệ trên thương trường và cuối cùng tỏa ra khắp nơi trên thế giới. Covey trình bày bản đồ hành trình để xây dựng niềm tin ở mọi cấp độ, xây dựng tính cách và năng lực, nâng cao mức độ tin cậy và thiết lập sự lãnh đạo truyền cảm hứng cho mọi người.'),
('B011',N'Thói quen thứ 8',6,1,'Stephen Covey',1,'01-21-2020',69000,100,N'Thói quen thứ 8 - Một giải pháp mới dành cho lãnh đạo trong thời đại kinh tế tri thức và cho những ai đang tìm cách định vị bản thân. Trong cuốn The 7 Habits of Highly Effective People, Covey đã chỉ cách làm cho ta trở nên đắc lực, làm việc có hiệu quả. Tuy nhiên, so với hoàn cảnh lúc quyển sách ra đời, thế giới ngày nay đã khác, nhiều thách thức hơn và cũng phức tạp hơn. Covey đã bỏ ra năm năm nghiên cứu, soạn thảo, thử nghiệm để cuối cùng trình làng cuốn Thói quen thứ 8 cho thời kỳ mà Covey mệnh danh là Thời đại của người lao động tri thức')




--3. Liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay
select b.BookName,b.PublishingYear

from Book b where year(b.PublishingYear) >= 2008

--4. Liệt kê 10 cuốn sách có giá bán cao nhất

select top 10 price,BookName
from Book 
order by price asc
--5 Tìm những cuốn sách có tiêu đề chứa từ “Hành trình”
select Book.BookName
from Book where Book.BookName like N'%Hành trình%'

--6 Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần
select Book.BookName,Book.price
from Book where Book.BookName like N'T%'
order by Book.price desc
--7. Liệt kê các cuốn sách của nhà xuất bản Tri thức

select b.BookName
from Book b
inner join Company C on C.CompanyId=b.CompanyId and C.CompanyName = 'Tri Thuc'

--8 Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái”

select c.CompanyName,c.Address,c.PhoneNumber
from Company c
inner join Book b on b.CompanyId=c.CompanyId and b.BookName = N'Trí Tuệ Người Do Thái'



/*9. Hiển thị các thông tin sau về các cuốn sách: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản,
Loại sách*/


select b.BookId,b.BookName,b.PublishingYear,b.BookId,b.BookTypeId
from Book b
inner join BookType bt on bt.BookTypeId = b.BookTypeId
inner join Company c on c.CompanyId = b.CompanyId


--10. Tìm cuốn sách có giá bán đắt nhất
select top 1 b.price,b.BookName
from Book b
order by b.price desc

--11. Tìm cuốn sách có số lượng lớn nhất trong kho
select top 1 b.Qty,b.BookName

from Book b
order by b.Qty desc


--12 Tìm các cuốn sách của tác giả “Eran Katz”
select B.BookName
from Book B where b.Author = 'Eran Katz'

--13 Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước
alter table Book
add Sale varchar(5)
update Book
set Sale = '10%'
where year(PublishingYear) <= 2008



--14. Thống kê số đầu sách của mỗi nhà xuất bản
select C.CompanyName,count(b.BookId)
from Book b 
inner join Company c on c.CompanyId=b.CompanyId
group by c.CompanyName

-- 15 Thống kê số đầu sách của mỗi loại sách

select bt.BookTypeName,count(b.BookId)
from BookType bt 
inner join Book b on b.BookTypeId=bt.BookTypeId
group by bt.BookTypeName

--16. Đặt chỉ mục (Index) cho trường tên sách
create index Book_Name
on Book(BookName)

--17 Viết view lấy thông tin gồm: Mã sách, tên sách, tác giả, nhà xb và giá bán
create view Book_Book
as
select b.BookId,b.BookName,b.Author,c.CompanyName,b.price
from Book b
inner join Company c on c.CompanyId=b.CompanyId

--◦ SP_Them_Sach: thêm mới một cuốn sách
create proc SP_Them_Sach
@BookId varchar(15),
@BookName nvarchar(50),
@BookTypeId int,
@CompanyId int,
@Author varchar(40),
@Editions int,
@PublishingYear date,
@price money,
@Qty int,
@SummaryContent nvarchar(1000)
as
IF EXISTS (SELECT * FROM Book WHERE BookId =@BookId)
    RETURN 0
insert into Book(BookId,BookName,BookTypeId,CompanyId,Author,Editions,PublishingYear,price,Qty,SummaryContent) values (
@BookId,
@BookName,
@BookTypeId,
@CompanyId,
@Author,
@Editions,
@PublishingYear,
@price,
@Qty,
@SummaryContent)


exec SP_Them_Sach 'B101',N'Đời ngắn đừng ngủ dài',1,9,'Robin Sharma',1,'09-29-2010',115000,150,N'Đời Ngắn Đừng Ngủ Dài là những ghi chép, những trải nghiệm và suy ngẫm của tác giả về cuộc đời, về cách sống, những thói quen tốt trong cuộc sống thường ngày. Đó không phải là những bài giảng với mớ lý thuyết khô khan mà là những lời chia sẻ đầy chân tình và gần gũi mà ai cũng có thể hiểu và áp dụng được. Xuyên suốt cuốn sách là 101 quan điểm, 101 bài học, 101 mẫu chuyện rất ngắn gọn, rất súc tích. Mỗi chủ đề không quá hai trang với lời văn nhẹ nhàng được trình bày thật ngắn gọn nhưng chứa đựng nhiều sự thông tuệ và để lại nhiều lời khuyên sâu sắc cho người đọc. Hơn nữa, ta có thể giở bất kỳ một trang để đọc, không cần theo thứ tự, đọc khi nào bạn muốn, lúc gặp khó khăn hay thất bại trong cuộc sống, lúc bạn cảm thấy yếu đuối, mất tinh thần, trước khi đi ngủ...'


-- SP_Tim_Sach: Tìm các cuốn sách theo từ khóa

create proc SP_Tim_Sach
@SummaryContent nvarchar(1000)
as
select BookName
from Book where SummaryContent like N'%'+ @SummaryContent+ '%'


exec SP_Tim_Sach N'ghi chép'


--◦ SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục
create proc SP_Sach_ChuyenMuc
@BookTypeId int
as
select B.BookName,bt.BookTypeName
from Book B
inner join BookType bt on B.BookTypeId=bt.BookTypeId and bt.BookTypeId=@BookTypeId



exec SP_Sach_ChuyenMuc 4



select * from Book
select * from BookType
select * from Company
