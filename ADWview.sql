--//------------- 39. View SQL serveris

-- Liitpäring kahe tabeli vahel
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

-- View loomine liitpäringu baasil
CREATE VIEW vWEmployeeByDepartment
AS
	SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup 
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;
				
SELECT * FROM vWEmployeeByDepartment;

-- View koos WHERE tingimusega
CREATE VIEW vWQualityAssuranceDepartment_Employees
AS
	SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName
					WHERE DimDepartmentGroup.DepartmentGroupName = 'Quality Assurance';

SELECT * FROM vWCorporateDepartment_Employees;

-- View, mis näitab ainult mitte-konfidentsiaalset infot
CREATE VIEW vWEmployeesNonConfidentialData
AS
	SELECT EmployeeKey, FirstName, Gender, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

SELECT * FROM vWEmployeesNonConfData;

-- View koos grupeerimisega
CREATE VIEW vWEmployeesCountByDepartment
AS
	SELECT DepartmentName, COUNT(DepartmentGroupName) AS TotalEmployees
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName
					GROUP BY DepartmentName;

SELECT * FROM vWEmployeesCountByDepartment


-- Kui soovid vaadata view definitsiooni
sp_helptext vWName;

-- Kui soovid muuta view-d
ALTER VIEW;

-- Kui soovid kustutada view-d 
DROP VIEW vWName;

--//------------- 40. View uuendused

-- Lihtne view ilma palgainfota
CREATE VIEW vWEmployeesDataExSalary
AS
	SELECT EmployeeKey, FirstName, Gender, DepartmentName
		FROM DimEmployee;

SELECT * FROM vWEmployeesDataExSalary;

-- Andmete uuendamine läbi view
UPDATE vWEmployeesDataExSalary
SET FirstName = 'Mikey' WHERE EmployeeKey = 2;

-- Kontrollime uuendust algtabelis
SELECT FirstName FROM DimEmployee WHERE EmployeeKey = 2;

-- Kustutamine läbi view
DELETE FROM vWEmployeesDataExSalary WHERE EmployeeKey = 2;
-- Sisestamine läbi view (võib anda vea kui view'il on piirangud)
INSERT INTO vWEmployeesDataExSalary VALUES (2, 'Mikey', 'M', 2);


CREATE VIEW vWEmployeeDetailsByDepartment
AS
	SELECT EmployeeKey, FirstName, Gender, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

SELECT * FROM vWEmployeeDetailsByDept;


-- Andmete kontroll enne uuendamist
SELECT FirstName, DepartmentName FROM DimEmployee WHERE FirstName = 'Diane';

-- Uuendamine läbi view, mis põhineb liitpäringul
UPDATE vWEmployeeDetailsByDepartment
SET DepartmentName = 'Quality Assurance' WHERE FirstName = 'Diane';

SELECT FirstName, DepartmentName FROM DimEmployee WHERE FirstName = 'Diane';