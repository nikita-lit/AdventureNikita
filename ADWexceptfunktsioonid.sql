--//------------- 87. Except operaator

-- Except operaator tagastab esimese päringu unikaalsed read, mida pole teises
SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer;

-- Koos WHERE ja ORDER BY-ga
SELECT EmployeeKey, FirstName, Gender, BaseRate FROM DimEmployee
WHERE BaseRate >= 10
EXCEPT
SELECT CustomerKey, FirstName, Gender, BaseRate FROM DimCustomer
WHERE BaseRate >= 20
ORDER BY FirstName;

--//------------- 88. Erinevus Except ja not in operaatoril

-- NOT IN kontrollib ainult ühte veergu
SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer);

INSERT INTO DimEmployee VALUES (1, 'Mark', 'Male');

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer;

-- NOT IN ei eemalda dubleerivaid ridu
SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer);

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer;

-- Viga - alamparingul liiga palju veerge
SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey, FirstName FROM DimCustomer)