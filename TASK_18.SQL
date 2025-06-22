-- Drop the table if it exists (for reusability)
DROP TABLE IF EXISTS EmployeeCost;
GO

-- Create the table
CREATE TABLE EmployeeCost (
    BU_Name       VARCHAR(50),
    Month_Year    VARCHAR(10),   -- Format: YYYY-MM
    CostPerHead   DECIMAL(10,2),
    HeadCount     INT
);
GO

-- Insert sample data
INSERT INTO EmployeeCost (BU_Name, Month_Year, CostPerHead, HeadCount) VALUES
('HR', '2024-01', 70000, 10),
('HR', '2024-01', 75000, 5),
('IT', '2024-01', 80000, 4),
('IT', '2024-01', 90000, 6),
('HR', '2024-02', 72000, 8),
('HR', '2024-02', 78000, 7),
('IT', '2024-02', 85000, 5),
('IT', '2024-02', 87000, 5);
GO

-- Calculate weighted average cost per BU per month
SELECT 
    BU_Name,
    Month_Year,
    CAST(SUM(CostPerHead * HeadCount) * 1.0 / SUM(HeadCount) AS DECIMAL(10, 2)) AS Weighted_Avg_Cost
FROM 
    EmployeeCost
GROUP BY 
    BU_Name, 
    Month_Year
ORDER BY 
    BU_Name, 
    Month_Year;
GO
