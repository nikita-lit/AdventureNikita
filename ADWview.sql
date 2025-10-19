--//------------- 39. View SQL serveris

SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

CREATE VIEW vWEmployeeByDepartment
AS
	SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup 
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;
				
SELECT * FROM vWEmployeeByDepartment;


CREATE VIEW vWQualityAssuranceDepartment_Employees
AS
	SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName
					WHERE DimDepartmentGroup.DepartmentGroupName = 'Quality Assurance';

SELECT * FROM vWCorporateDepartment_Employees;


CREATE VIEW vWEmployeesNonConfidentialData
AS
	SELECT EmployeeKey, FirstName, Gender, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

SELECT * FROM vWEmployeesNonConfData;


CREATE VIEW vWEmployeesCountByDepartment
AS
	SELECT DepartmentName, COUNT(DepartmentGroupName) AS TotalEmployees
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName
					GROUP BY DepartmentName;

SELECT * FROM vWEmployeesCountByDepartment


sp_helptext vWName;

ALTER VIEW;

DROP VIEW vWName;

--//------------- 40. View uuendused

CREATE VIEW vWEmployeesDataExSalary
AS
	SELECT EmployeeKey, FirstName, Gender, DepartmentName
		FROM DimEmployee;

SELECT * FROM vWEmployeesDataExSalary;


UPDATE vWEmployeesDataExSalary
SET FirstName = 'Mikey' WHERE EmployeeKey = 2;

SELECT FirstName FROM DimEmployee WHERE EmployeeKey = 2;

DELETE FROM vWEmployeesDataExSalary WHERE EmployeeKey = 2;
INSERT INTO vWEmployeesDataExSalary VALUES (2, 'Mikey', 'M', 2);


CREATE VIEW vWEmployeeDetailsByDepartment
AS
	SELECT EmployeeKey, FirstName, Gender, DepartmentName
		FROM DimEmployee
			JOIN DimDepartmentGroup
				ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

SELECT * FROM vWEmployeeDetailsByDept;


SELECT FirstName, DepartmentName FROM DimEmployee WHERE FirstName = 'Diane';

UPDATE vWEmployeeDetailsByDepartment
SET DepartmentName = 'Quality Assurance' WHERE FirstName = 'Diane';

SELECT FirstName, DepartmentName FROM DimEmployee WHERE FirstName = 'Diane';