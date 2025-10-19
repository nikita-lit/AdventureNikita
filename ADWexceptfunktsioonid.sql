--//------------- 87. Except operaator

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer;


SELECT EmployeeKey, FirstName, Gender, BaseRate FROM DimEmployee
WHERE BaseRate >= 10
EXCEPT
SELECT CustomerKey, FirstName, Gender, BaseRate FROM DimCustomer
WHERE BaseRate >= 20
ORDER BY FirstName;

--//------------- 88. Erinevus Except ja not in operaatoril

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer;

SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer);

INSERT INTO DimEmployee VALUES (1, 'Mark', 'Male');


SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer;

SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer);


SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey, FirstName FROM DimCustomer)