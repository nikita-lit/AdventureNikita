--//-------------  92. DDL Trigger SQL serveris

-- DDL triggeri üldine süntaks
CREATE TRIGGER [Trigger_Name]
ON [Scope(Server/Database)]
FOR [EventType1, EventType2, EventType3]
AS
BEGIN
-- Trigger Body
END;

-- Lihtne DDL trigger tabeli loomisele
CREATE TRIGGER trMyFirstTrigger
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	PRINT 'New table created'
END;

CREATE TABLE test (id int);

-- Muudame triggerit, et see reageeriks rohkematele sündmustele
ALTER TRIGGER trMyFirstTrigger 
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	PRINT 'A table just been created, modified or deleted'
END;

DROP TABLE test;

-- Trigger, mis blokeerib tabelite muutmise
ALTER TRIGGER trMyFirstTrigger 
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT 'You cannot create, modify, alter or drop a table'
END;

-- Proovime kustutada (ei õnnestu)
DROP TABLE test;

-- Triggeri keelamine ja kustutamine
DISABLE TRIGGER trMyFirstTrigger ON DATABASE;
DROP TRIGGER trMyFirstTrigger ON DATABASE;

-- Trigger ümbernimetamise sündmusele
CREATE TRIGGER trRenameTable 
ON DATABASE
FOR RENAME
AS
BEGIN
	PRINT 'You just renamed something'
END;

sp_rename 'Test', 'NewTestTable';
sp_rename 'NewTestTable.Id' , 'NewId', 'column';


--//------------- 93. Server-Scoped DDL triggerid

-- Andmebaasi taseme DDL trigger
CREATE TRIGGER tr_DatabaseScopeTrigger 
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT 'You cannot create, modify, alter or drop a table in the current database'
END;

-- Serveri taseme DDL trigger (kehtib kõikidele andmebaasidele)
CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT 'You cannot create, modify, alter or drop a table in the current database'
END;

-- Serveri taseme triggeri haldamine
DISABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER;
ENABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER;
DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER;