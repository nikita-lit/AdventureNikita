--funktsioonid
SELECT * FROM DimEmployee; 

--Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF) koodin‰ide:
CREATE FUNCTION fn_ILVF_GetEmployees()
RETURNS TABLE AS
	RETURN (SELECT EmployeeKey, FirstName, CAST(BirthDate AS DATE) AS DOB FROM DimEmployee);

SELECT * FROM fn_ILVF_GetEmployees();