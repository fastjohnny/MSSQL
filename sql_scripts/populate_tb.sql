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
   CREATE TABLE @tid
   (ProductID int PRIMARY KEY NOT NULL,
    ProductName varchar(25) NOT NULL,
    Price money NULL,
    ProductDescription text NULL)
END
GO
EXEC populateTables;
GO


CREATE PROCEDURE populateProducts @TABname INT
AS
DECLARE @hid INT;
SET @hid=1;
WHILE @hid < 1000
BEGIN 
    INSERT INTO @TABname (ProductID, ProductName, Price, ProductDescription) 
    VALUES(@hid, 'samplemail.com', 2045, 'Sample Description'); 
    SET @hid = @hid + 1;
END
GO

CREATE PROCEDURE populateProductsTables
AS
DECLARE @mid INT;
SET @mid=1;
WHILE @mid < 1000
BEGIN
    EXEC populateProducts  @TABname=@mid
END
GO


SELECT TABLE_NAME FROM TEST_BASE.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
GO

