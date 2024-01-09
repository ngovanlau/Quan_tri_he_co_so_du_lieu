use master
go

create database CSDL1

use CSDL1
go

create table SinhVien (
	MSSV char(20) primary key,
	HoSV nvarchar(30),
	TenSV nvarchar(30)
)

insert into SinhVien
values (2151053034, 'Ngo', 'Van Lau');


use master
go
drop database CSDL1;

use CSDL1
go
select * from SinhVien

backup database CSDL1
to disk = 'D:\Backup\CSDLFull2.bak'

insert into SinhVien
values (2151053035, 'Ngo', 'Van A');

select * from SinhVien

backup database CSDL1
to disk = 'D:\Backup\CSDLDiff2.bak'
with differential

restore database CSDL1
from disk = 'D:\Backup\CSDLFull2.bak'
with NoRecovery

restore database CSDL1
from disk = 'D:\Backup\CSDLDiff2.bak'
with Recovery

use master
go

backup database AdventureWorks
to disk = 'D:\Backup\AdventureWorksStripe1.bak', 
   disk = 'D:\Backup\AdventureWorksStripe2.bak', 
   disk = 'D:\Backup\AdventureWorksStripe3.bak'

use master
go

backup database AdventureWorks
to disk = 'D:\Backup\AdventureWorksMirrored1.bak'
mirror
to disk = 'D:\Backup\AdventureWorksMirrored2.bak'
with format, description = 'Mirrored Backup'


use master
go

create master key
encryption by password = '12345'
go

create certificate HoTen
with subject = 'Ngo Van Lau';
go

backup database CSDL1
to disk = 'D:\Backup\CSDL14.bak'
with encryption 
(
	algorithm = AES_256,
	server certificate = HoTen
)
go

restore database CSDL1
from disk = 'D:\Backup\CSDL14.bak'

restore database CSDL1
from disk = 'D:\Backup\CSDL14.bak'
with move 'CSDL1' to 'D:\Backup\Cau15\CSDL1.mdf',
	 move 'CSDL1_Log' to 'D:\Backup\CSDL1.ldf', replace