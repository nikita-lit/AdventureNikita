--//------------- 98. Where ja Having erinevused

SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName;

SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName HAVING SUM(ReorderPoint) > 500;

SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName HAVING SUM(ReorderPoint) > 500;

SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
WHERE EnglishProductName IN('Blade', 'Bearing Ball') GROUP BY EnglishProductName;

SELECT EnglishProductName, SUM(ReorderPoint) AS TotalSales FROM DimProduct
GROUP BY EnglishProductName HAVING EnglishProductName IN('Blade', 'Bearing Ball');




