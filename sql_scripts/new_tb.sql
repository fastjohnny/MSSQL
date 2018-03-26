IF EXISTS(SELECT * from sys.databases WHERE name='TEST_BASE')  
BEGIN  
    DROP DATABASE TEST_BASE;  
END  
CREATE DATABASE TEST_BASE;
GO
USE TEST_BASE
GO  
CREATE TABLE dbo.Products  
   (ProductID int PRIMARY KEY NOT NULL,  
    ProductName varchar(25) NOT NULL,  
    Price money NULL,  
    ProductDescription text NULL)  
GO 

#INSERT INTO dbo.Products(ProductID, ProductName, Price, ProductDescription) 
#VALUES (1, 'prod1', 103, 'test prod not for child')
#GO
#INSERT INTO dbo.Products(ProductID, ProductName, Price, ProductDescription)
#SELECT 32, ProductName, Price, ProductDescription FROM dbo.Products
#WHERE ProductID <> 32 
#GO
#SELECT * FROM dbo.Products;
#GO


CREATE PROCEDURE populateProducts
AS
DECLARE @hid INT;
SET @hid=16;
WHILE @hid < 100
BEGIN 
    INSERT INTO dbo.Products (ProductName, Price, ProductDescription) 
    VALUES('samplemail.com', 2045, 'Sample Description' + LTRIM(STR(@hid))); 
    SET @hid = @hid + 1;
END

EXEC populateProducts; 
GO
