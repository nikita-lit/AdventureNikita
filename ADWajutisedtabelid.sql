--//------------- 34. ajutisedTabelid

-- Lokaalne ajutine tabel
CREATE TABLE #PersonDetails(Id int, Name nvarchar(20))

INSERT INTO #PersonDetails VALUES (1, 'Mike')
INSERT INTO #PersonDetails VALUES (2, 'John')
INSERT INTO #PersonDetails VALUES (3, 'Todd')

SELECT * FROM #PersonDetails;


SELECT Name FROM tempdb..sysobjects 
WHERE Name LIKE '#PersonDetails%';

-- Protseduuri et lokaalne ajutine tabel luua
CREATE PROCEDURE spCreateLocalTempTable
AS
BEGIN
	CREATE TABLE #PersonDetails(ID INT, Name NVARCHAR(20))
	INSERT INTO #PersonDetails VALUES(1,'Mike')
	INSERT INTO #PersonDetails VALUES(2,'John')
	SELECT * FROM #PersonDetails
END;

EXEC spCreateLocalTempTable;


-- Globaalne ajutine tabel
CREATE TABLE ##EmployeeDetails(Id int, Name nvarchar(20))
SELECT * FROM ##EmployeeDetails;