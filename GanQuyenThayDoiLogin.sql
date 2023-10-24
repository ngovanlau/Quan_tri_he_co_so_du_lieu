use [master]
GO
GRANT ALTER ANY LOGIN TO [SQLVanLau]
GO

ALTER LOGIN SQLVanLau DISABLE;
--Vô hiệu hóa login
ALTER LOGIN SQLVanLau ENABLE;
--Kích hoạt login
ALTER LOGIN SQLVanLau WITH PASSWORD = '456';
--Đổi mật khẩu