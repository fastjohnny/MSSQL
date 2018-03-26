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
