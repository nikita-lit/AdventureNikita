-- #PersonDetails on local temporary tabel koos Id ja Name veeruga.
Create Table #PersonDetails(Id int, Name nvarchar(20))

-- Sisesta andmed ajutisse tabelisse:
Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');

-- Vaata tabeli sisu ajutise tabeli abil:
Select * from #PersonDetails

DROP TABLE #PersonDetails;

SELECT name FROM tempdb..sysobjects
WHERE name LIKE '#PersonDetails%'

-- Allpool olevas SP-s luuakse ajutine tabel #PersonsDetails ja edastab andmeid ja 
-- lõhub ajutise tabeli automaatselt peale käsu lõpule jõudmist.
Create Procedure spCreateLocalTempTable
as
Begin
    Create Table #PersonDetails (Id int, Name nvarchar(20))

    Insert into #PersonDetails Values(1, 'Mike')
    Insert into #PersonDetails Values(2, 'John')
    Insert into #PersonDetails Values(3, 'Todd')

    Select * from #PersonDetails
End

EXEC spCreateLocalTempTable

-- EmployeeDetails table on globaalne ajutine tabel. ##
CREATE TABLE ##EmployeeDetails (Id int, Name nvarchar(20))
SELECT * FROM ##EmployeeDetails;