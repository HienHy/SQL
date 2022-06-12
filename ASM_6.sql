if exists (select * from sys.databases where name='ASM_6')
drop database ASM_6
go
create database ASM_6
go
use ASM_6
go