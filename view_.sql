create view hello_view
as select Name,ContactTypeID,ModifiedDate
from Person.ContactType

go
create view inner_view
as 
select PersonID,ContactTypeID
from Person.BusinessEntityContact inner join 
Person.BusinessEntity on Person.BusinessEntity.BusinessEntityID = Person.BusinessEntityContact.BusinessEntityID
go

create view Encryption_view
with Encryption as
select PersonID,ContactTypeID
from Person.BusinessEntityContact inner join 
Person.BusinessEntity on Person.BusinessEntity.BusinessEntityID = Person.BusinessEntityContact.BusinessEntityID


select * from Encryption_view
select * from hello_view
select * from inner_view



--xem dinh nghia
exec sp_helptext 'Encryption_view'


--xem phu thuoc
exec sp_depends 'inner_view'


select * from Person.BusinessEntityContact
select * from Person.BusinessEntity