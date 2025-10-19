--//------------- 35. indeksidServeris

-- Päring ilma indeksita (aeglam)
SELECT * FROM DimEmployee 
WHERE BaseRate > 50 AND BaseRate < 70;

-- Indeksi loomine BaseRate veerule
CREATE INDEX IX_DimEmployee_BaseRate
ON DimEmployee (BaseRate ASC);

-- Sama päring indeksiga (kiirem)
SELECT * FROM DimEmployee 
WHERE BaseRate > 50 AND BaseRate < 70;

-- Indeksid kuvamine
EXEC sp_helpindex DimEmployee;

-- Indeksi kustutamine
DROP INDEX DimEmployee.IX_DimEmployee_BaseRate;

--//------------- 36. Klastreeritud ja mitte-klastreeritud indeksid

-- Klastreeritud indeks määrab tabeli füüsilise järjestuse (ainult 1 tabeli kohta)
CREATE CLUSTERED INDEX IX_DimEmployee_FirstName
ON DimEmployee(FirstName)

-- Primaarvõtme kustutamine (kui see on klastreeritud indeks)
DROP INDEX DimEmployee.PK_DimEmployee_EmployeeKey;

-- Liitklastreeritud indeks kahe veeruga
CREATE CLUSTERED INDEX IX_DimEmployee_Gender_BaseRate
ON DimEmployee(Gender DESC, BaseRate ASC)

-- Mitte-klastreeritud indeks eraldi andmestruktuur
CREATE NONCLUSTERED INDEX IX_DimEmployee_FirstName
ON DimEmployee(FirstName)

EXEC sp_helpindex DimEmployee;

--//------------- 37. Unikaalne ja mitte-unikaalne Index

-- Unikaalne indeks tagastab vea duplikaatide korral
CREATE UNIQUE NONCLUSTERED INDEX UIX_DimEmployee_FirstName_LastName
On DimEmployee(FirstName, LastName)

-- Unikaalse piirangu lisamine
ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_DimEmployee_Title
UNIQUE NONCLUSTERED (Title)

-- Piirangute kuvamine
EXECUTE sp_helpconstraint DimEmployee 

-- Unikaalne indeks, mis ignoreerib duplikaate
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