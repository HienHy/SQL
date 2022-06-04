CREATE DATABASE hienhy
ON PRIMARY 
( 
NAME = N'hienhy_DB',
FILENAME = N'C:\Temp\hienhy.mdf'
)
LOG ON 
( 
NAME = N'hienhy_DB_log',
FILENAME = N'C:\Temp\hienhy_DB_log.ldf'
)
COLLATE SQL_latin1_General_CP1_CI_AS