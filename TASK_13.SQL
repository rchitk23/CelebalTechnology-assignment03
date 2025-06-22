-- Drop existing table if present
IF OBJECT_ID('BU_Financials', 'U') IS NOT NULL DROP TABLE BU_Financials;

-- Create Table
CREATE TABLE BU_Financials (
    BU VARCHAR(50),
    Month VARCHAR(20),
    Cost FLOAT,
    Revenue FLOAT
);

-- Insert Sample Data
INSERT INTO BU_Financials VALUES ('Sales', 'June', 2000, 5000);
INSERT INTO BU_Financials VALUES ('IT', 'June', 1500, 6000);
INSERT INTO BU_Financials VALUES ('Sales', 'July', 2200, 5200);
INSERT INTO BU_Financials VALUES ('IT', 'July', 1400, 5600);
INSERT INTO BU_Financials VALUES ('HR', 'June', 1000, 2000);
INSERT INTO BU_Financials VALUES ('HR', 'July', 1100, 2100);

-- Final Query: Cost-to-Revenue Ratio month-on-month
SELECT 
    BU,
    Month,
    Cost,
    Revenue,
    ROUND(Cost / Revenue, 2) AS Cost_Revenue_Ratio
FROM 
    BU_Financials
ORDER BY 
    BU, Month;
