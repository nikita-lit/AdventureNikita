--//------------- 98. Where ja Having erinevused

-- Lihtne GROUP BY päring ilma filtreerimiseta
SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName;

-- HAVING filtreerib grupeeritud tulemusi (pärast grupeerimist)
SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName HAVING SUM(ReorderPoint) > 500;

SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName HAVING SUM(ReorderPoint) > 500;

-- WHERE filtreerib enne grupeerimist (algandmeid)
SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
WHERE EnglishProductName IN('Blade', 'Bearing Ball') GROUP BY EnglishProductName;

-- HAVING filtreerib pärast grupeerimist (grupeeritud tulemeid)
SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName HAVING EnglishProductName IN('Blade', 'Bearing Ball');




