-- Skaleeritav funktsioon ilma kr�pteerimata
CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(20) AS
BEGIN
	RETURN (SELECT FirstName FROM DimEmployee WHERE EmployeeKey = @Id)
END

SELECT dbo.fn_GetEmployeeNameById(1);

-- N��d muudame funktsiooni ja kr�pteerime selle �ra
ALTER FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(20) WITH ENCRYPTION AS
BEGIN
	RETURN (SELECT FirstName FROM DimEmployee WHERE EmployeeKey = @Id)
END

SELECT dbo.fn_GetEmployeeNameById(1);

-- N��d muuda funktsiooni ja kasuta k�sklust WITH SCHEMABINDING valikut
ALTER FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(20) WITH SCHEMABINDING AS
BEGIN
	RETURN (SELECT FirstName FROM dbo.DimEmployee WHERE EmployeeKey = @Id)
END

SELECT dbo.fn_GetEmployeeNameById(1);