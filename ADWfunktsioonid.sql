--//------------- 32. funktsioonid
SELECT * FROM DimEmployee

-- Inline Table Valued Function (ILTVF)
CREATE FUNCTION fn_ILTVF_GetEmployees()
RETURNS TABLE
AS
RETURN (SELECT EmployeeKey, FirstName, CAST(BirthDate AS date) AS DOB 
	FROM dbo.DimEmployee);

SELECT * FROM fn_ILTVF_GetEmployees();


-- Multi-statement table valued function (MSTVF)
CREATE FUNCTION fn_MSTVF_GetEmployees()
RETURNS @Table TABLE (EmployeeKey int, FirstName nvarchar(20), DOB date)
AS
BEGIN
    INSERT INTO @Table
    SELECT EmployeeKey, FirstName, CAST(BirthDate AS date)
		FROM DimEmployee

    RETURN
END;

SELECT * FROM fn_MSTVF_GetEmployees()

--//------------- 33. funktsioonid
CREATE FUNCTION fn_GetEmployeeNameById(@EmployeeKey int)
RETURNS nvarchar(20)
AS
BEGIN
	RETURN (SELECT FirstName FROM DimEmployee 
		WHERE EmployeeKey = @EmployeeKey)
END

EXEC sp_helptext fn_GetEmployeeNameById;


ALTER FUNCTION fn_GetEmployeeNameById(@EmployeeKey int)
RETURNS nvarchar(20)
WITH Encryption 
AS
BEGIN
	RETURN (SELECT FirstName FROM DimEmployee 
		WHERE EmployeeKey = @EmployeeKey)
END

EXEC sp_helptext fn_GetEmployeeNameById;


ALTER FUNCTION fn_GetEmployeeNameById(@EmployeeKey int)
RETURNS nvarchar(20)
WITH SchemaBinding
AS
BEGIN
	RETURN (SELECT FirstName FROM dbo.DimEmployee 
		WHERE EmployeeKey = @EmployeeKey)
END;

EXEC sp_helptext fn_GetEmployeeNameById;

DROP TABLE DimEmployee;