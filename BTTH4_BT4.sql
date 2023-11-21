USE master
GO

sp_helpdb 'AdventureWorks'

USE AdventureWorks
GO
sp_changedbowner 'sa'
GO

USE AdventureWorks
GO

CREATE SCHEMA MySchema
GO

CREATE TABLE MySchema.SinhVien 
(
	MaSV char(10) primary key,
	HoSV nvarchar(100),
	TenSV nvarchar(50),
)
GO

DROP SCHEMA MySchema