IF EXISTS(SELECT * from sys.databases WHERE name='TEST_BASE')
BEGIN
    DROP DATABASE TEST_BASE;
END
CREATE DATABASE TEST_BASE;
GO
USE TEST_BASE
GO

CREATE PROCEDURE populateTables
AS
DECLARE @tid INT;
SET @tid=1;
WHILE @tid < 1000
BEGIN
   CREATE TABLE CAST( @tid AS varchar(10))
   (ProductID int PRIMARY KEY NOT NULL,
    ProductName varchar(25) NOT NULL,
    Price money NULL,
    ProductDescription text NULL)
END
GO
EXEC populateTables;
GO

