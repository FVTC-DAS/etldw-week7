-- Week 7: ETL Setup Script
-- Creates the required Standard Tables, Fact, Audit, and Error Logging Tables

-- NOTE: Execute this script against the new, dedicated DW_Demo_Labs database.

USE DW_Demo_Labs;
GO

-- 1. Standard Dimension Tables
CREATE TABLE DimProductStandard (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductCode VARCHAR(20) NOT NULL UNIQUE, -- Natural Key for Lookup
    ProductName VARCHAR(100)
);

CREATE TABLE DimCustomerStandard (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerCode VARCHAR(20) NOT NULL UNIQUE, -- Natural Key for Lookup
    CustomerName VARCHAR(100)
);

-- 2. Fact Table
CREATE TABLE FactSalesStandard (
    FactKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductKey INT NOT NULL REFERENCES DimProductStandard(ProductKey),
    CustomerKey INT NOT NULL REFERENCES DimCustomerStandard(CustomerKey),
    SaleDate DATE NOT NULL,
    Quantity INT
);

-- 3. Audit Log Table (Control Flow Auditing)
CREATE TABLE ETLAuditLog (
    AuditKey INT IDENTITY(1,1) PRIMARY KEY,
    PackageName VARCHAR(100) NOT NULL,
    Status VARCHAR(20) NOT NULL, -- e.g., 'Running', 'Success', 'Failure'
    StartTime DATETIME NOT NULL,
    EndTime DATETIME
);

-- 4. Error Log Table (Data Flow Rejection Path)
CREATE TABLE ETLErrorLog (
    ErrorKey INT IDENTITY(1,1) PRIMARY KEY,
    PackageName VARCHAR(100),
    ErrorReason VARCHAR(255) NOT NULL, -- Custom message: Missing Key, Invalid Quantity
    SourceData_ProductID VARCHAR(20),
    SourceData_CustomerID VARCHAR(20),
    SourceData_Quantity VARCHAR(20) -- Store as VARCHAR to handle NULLs/bad types
);

GO

