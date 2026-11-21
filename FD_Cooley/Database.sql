IF DB_ID('FavoriteDessertDB') IS NULL
    CREATE DATABASE FavoriteDessertDB;
GO
USE FavoriteDessertDB;
GO
IF OBJECT_ID('dbo.DessertRecords', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.DessertRecords (
        DessertID INT IDENTITY(1,1) PRIMARY KEY,
        FullName NVARCHAR(100) NOT NULL,
        FavoriteDessert NVARCHAR(50) NOT NULL,
        LikesChocolate BIT NOT NULL
    );
END;
GO
