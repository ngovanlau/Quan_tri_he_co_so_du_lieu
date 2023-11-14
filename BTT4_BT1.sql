USE master
CREATE DATABASE NgoVanLau
ON 
(
	name = 'NgoVanLau', --ten logic
	filename = 'D:\Quan_tri_he_co_so_du_lieu\NgoVanLau.mdf', --ten vat ly
	Size = 20MB,
	Maxsize = 200MB,
	FileGrowth = 10% --khi Dl nhieu hon 20MB tu dong tang 10%
)
LOG ON
(
	name = 'NgoVanLau_log', --ten logic
	filename = 'D:\Quan_tri_he_co_so_du_lieu\NgoVanLau_log.ldf', --ten vat ly
	Size = 20MB,
	Maxsize = 200MB,
	FileGrowth = 10% --khi Dl nhieu hon 20MB tu dong tang 10%
)

--Kiem tra kieu phuc hoi
USE NgoVanLau
SELECT name, recovery_model_desc
FROM sys.databases

--Chỉnh Recovery model: Full
USE master
ALTER DATABASE NgoVanLau SET RECOVERY FULL

--Kiem tra datafile trong database
USE NgoVanLau
SELECT * 
FROM sys.database_files

--Kiem tra filegroup trong database
USE NgoVanLau
SELECT * 
FROM sys.filegroups

--Thêm Filegroup tên F1 có thuộc tính read only
ALTER DATABASE NgoVanLau
ADD FILEGROUP F1

--Thêm Filegroup tên F2 có thuộc tính default
ALTER DATABASE NgoVanLau
ADD FILEGROUP F2

--Thêm data file tên NDF1 thuộc filegroup F1
ALTER DATABASE NgoVanLau
ADD FILE(NAME='NDF1', FILENAME='D:\Quan_tri_he_co_so_du_lieu\NDF1.ndf')
TO FILEGROUP F1

--Thêm data file tên NDF2 thuộc filegroup F2
ALTER DATABASE NgoVanLau
ADD FILE(NAME='NDF2', FILENAME='D:\Quan_tri_he_co_so_du_lieu\NDF2.ndf')
TO FILEGROUP F2

--Thêm log file tên log1?
--Bi loi
ALTER DATABASE NgoVanLau
ADD LOG FILE
(
	NAME = 'NgoVanLau_log1',
	FILENAME = 'D:\Quan_tri_he_co_so_du_lieu\NgoVanLau_log1.ldf'
) 
TO FILEGROUP F1

--Khong bi loi
ALTER DATABASE NgoVanLau
ADD LOG FILE
(
	NAME = 'NgoVanLau_log1',
	FILENAME = 'D:\Quan_tri_he_co_so_du_lieu\NgoVanLau_log1.ldf'
)