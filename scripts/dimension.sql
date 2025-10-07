-- Week 7: ETL Setup Script
-- Populates the standard dimension tables with keys required for successful Lookups.
-- Note: GHI-777 and JKL-222 are intentionally omitted to cause Lookup errors in the demo data.

USE DW_Demo_Labs;
GO

-- Populate Product Dimension (Only including products that pass the Lookup)
INSERT INTO DimProductStandard (ProductCode, ProductName) VALUES
('ABC-001', 'Widget A'),
('XYZ-999', 'Tool X'),
('DEF-456', 'Accessory D');

-- Populate Customer Dimension (All customers in the source file are included here)
INSERT INTO DimCustomerStandard (CustomerCode, CustomerName) VALUES
('CUST-100', 'Customer One'),
('CUST-200', 'Customer Two'),
('CUST-300', 'Customer Three'),
('CUST-400', 'Customer Four'),
('CUST-500', 'Customer Five');

GO
