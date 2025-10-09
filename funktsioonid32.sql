--funktsioonid
SELECT * FROM DimEmployee; 

--Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF) koodin‰ide:
CREATE FUNCTION fn_ILTVF_GetEmployees()
RETURNS TABLE AS
	RETURN (SELECT EmployeeKey, FirstName, CAST(BirthDate AS date) AS DOB FROM DimEmployee);

--  Mitme avaldisega tabeliv‰‰rtusega funktsioonid e multi-statement table valued function (MSTVF)
CREATE FUNCTION fn_MSTVF_GetEmployees()
RETURNS @Table TABLE (EmployeeKey INT, FirstName NVARCHAR(20), DOB date) AS
BEGIN
	INSERT INTO @Table
	SELECT EmployeeKey, FirstName, CAST(BirthDate AS date)
	FROM DimEmployee
	RETURN
END

SELECT * FROM fn_ILTVF_GetEmployees();
SELECT * FROM fn_MSTVF_GetEmployees();

UPDATE fn_ILTVF_GetEmployees() SET FirstName = 'Sam1' WHERE EmployeeKey = 1;