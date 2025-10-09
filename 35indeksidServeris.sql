SELECT * FROM DimEmployee WHERE BaseRate > 30 AND BaseRate < 40;

-- Loome indeksi, mis aitab päringut: Loome indeksi BaseRate veerule.
CREATE INDEX IX_DimEmployee_BaseRate 
ON DimEmployee(BaseRate ASC)

EXEC sp_helptext DimEmployee;

DROP INDEX DimEmployee.IX_DimEmployee_BaseRate;