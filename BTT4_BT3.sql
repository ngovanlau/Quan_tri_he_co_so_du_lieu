--Xem cac Synonym
SELECT 
	name,
	base_object_name,
	type
FROM
	sys.synonyms
ORDER BY
	name;
-- Tao cac Synonym
CREATE SYNONYM NhanVien
FOR AdventureWorks.HumanResources.Employee;

SELECT * 
FROM AdventureWorks.HumanResources.Employee;

SELECT *
FROM NhanVien

-- Xoa cac Synonym
DROP SYNONYM NhanVien