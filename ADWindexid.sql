--//------------- 35. indeksidServeris

SELECT * FROM DimEmployee 
WHERE BaseRate > 50 AND BaseRate < 70;


CREATE INDEX IX_DimEmployee_BaseRate
ON DimEmployee (BaseRate ASC);

SELECT * FROM DimEmployee 
WHERE BaseRate > 50 AND BaseRate < 70;


EXEC sp_helpindex DimEmployee;

DROP INDEX DimEmployee.IX_DimEmployee_BaseRate;

--//------------- 36. Klastreeritud ja mitte-klastreeritud indeksid

CREATE CLUSTERED INDEX IX_DimEmployee_FirstName
ON DimEmployee(FirstName)

DROP INDEX DimEmployee.PK_DimEmployee_EmployeeKey;

CREATE CLUSTERED INDEX IX_DimEmployee_Gender_BaseRate
ON DimEmployee(Gender DESC, BaseRate ASC)


CREATE NONCLUSTERED INDEX IX_DimEmployee_FirstName
ON DimEmployee(FirstName)

EXEC sp_helpindex DimEmployee;

--//------------- 37. Unikaalne ja mitte-unikaalne Index

CREATE UNIQUE NONCLUSTERED INDEX UIX_DimEmployee_FirstName_LastName
On DimEmployee(FirstName, LastName)

ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_DimEmployee_Title
UNIQUE NONCLUSTERED (Title)

EXECUTE sp_helpconstraint DimEmployee

CREATE UNIQUE INDEX IX_DimEmployee_Title
ON DimEmployee(Title)
WITH IGNORE_DUP_KEY


--//------------- 38. Indeksi plussid ja miinused

SELECT * FROM DimEmployee WHERE BaseRate > 5 AND BaseRate < 10;

DELETE FROM DimEmployee WHERE BaseRate = 9.50;
UPDATE DimEmployee SET BaseRate = 50 WHERE BaseRate = 9.25;

SELECT * FROM DimEmployee;

SELECT * FROM DimEmployee ORDER BY BaseRate;


SELECT * FROM DimEmployee ORDER BY BaseRate DESC;

SELECT BaseRate, COUNT(BaseRate) AS Total
FROM DimEmployee
GROUP BY BaseRate;