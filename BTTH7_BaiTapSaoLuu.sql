--Cau 16
--Tao database CSDL1

--Tạo bảng SinhVien
create table SinhVien
(
	MaSV int primary key,
	TenSV nvarchar(50)
)


--Sao luu CSDL1 Full và D:\QTCSDL\CSDL1_Backup.bak
use master
go 

backup database CSDL1
to disk = 'D:\QTCSDL\CSDL1_Backup.bak'

--them du lieu
use CSDL1
go 
insert into SinhVien
values (2151053036, 'Ngo', 'Van B');

--Sao luu CSDl1 Differential, cũng sao lưu vào file D:\QTCSDL\CSDL1_Backup.bak
use master
go 

backup database CSDL1
to disk = 'D:\QTCSDL\CSDL1_Backup.bak'
with differential, noinit

--Nhap them hang thu 2 vao SV
use CSDL1
go 
insert into SinhVien
values (2151053037, 'Ngo', 'Van C');

--Sao luu CSDL1 taillog, cũng sao lưu vào file D:\QTCSDL\CSDL1_Backup.bak
use master
go 

backup log CSDL1
to disk = 'D:\QTCSDL\CSDL1_Backup.bak'
with noinit

--Phuc hoi CSDL 1 từ 3 phần trên
	--Xoa CSDL1
	drop database CSDL1

	--Phuc hoi Full tu phan 1
	restore database CSDL1
	from disk = 'D:\QTCSDL\CSDL1_Backup.bak'
	with file=1, norecovery

	--Phuc hoi Diff tu phan 2
	restore database CSDL1
	from disk = 'D:\QTCSDL\CSDL1_Backup.bak'
	with file=2, norecovery

	--Phuc hoi taillog tu phan 3
	restore log CSDL1
	from disk = 'D:\QTCSDL\CSDL1_Backup.bak'
	with file=3, recovery
	--Truy xuat Dl
	use CSDL1
	go

	select * from SinhVien
		




--Cau 17
--Viết lệnh phục hồi CSDL2, lùi CSDL2 lại thời điểm ngay sau khi tạo CSDL2(lúc chưa nhập thông tin SV)
Use master
Go

Create database CSDL4 on Primary
(
	Name = N'CSDL4',
	Filename = N'D:\QTCSDL\CSDL4.mdf'
)
	Log on
(
	Name = N'CSDL4_log',
	Filename = N'D:\QTCSDL\CSDL4.ldf'
)

--Ghi lại thời gian 10:46

--Tạo bảng SinhVien 
use CSDL4
go

create table SinhVien (
	MSSV char(20) primary key,
	HoSV nvarchar(30),
	TenSV nvarchar(30)
)

--Sao luu CSDL4 vao 'D:\QTCSDL\CSDL4.bak'
backup database CSDL4
to disk = 'D:\QTCSDL\CSDL4.bak'
	
--Nhap dl vao SV
insert into SinhVien
values (2151053035, 'Ngo', 'Van A');

	--xem giờ 10:47
	
--cho khoang 5p	

--Nhap dl vao SV
insert into SinhVien
values (2151053036, 'Ngo', 'Van B');

	--xem giờ  10:53
--Sao luu CSDL4 taillog, cũng sao lưu vào file D:\QTCSDL\CSDL4_Backup.bak
backup log CSDL4
to disk = 'D:\QTCSDL\CSDL4_Backup.bak'

--Phục hồi CSDL về thời diểm chưa có bảng  SV
--Xoa CSDL4
use master
go

set dateformat dmy
restore database CSDL4
from disk = 'D:\QTCSDL\CSDL4.bak'
with stopat = '9/1/2024 10:48:00', norecovery
		
restore log CSDL4
from disk = 'D:\QTCSDL\CSDL4_Backup.bak'
with stopat = '9/1/2024 10:48:00', recovery

use CSDL4
go 
select * from SinhVien
		
--Cau 18: Su dung SNAPSHOT

--Tao database snapshot

create database AdventureWorksSnapShot on
(
	Name = 'AdventureWorks_data',
	Filename = N'D:\QTCSDL\AdventureWorksSnapShot.mdf'
)as Snapshot of AdventureWorks

use master 
go

restore database AdventureWorks
from database_snapshot ='AdventureWorksSnapShot'

