-- Drop table if it exists
IF OBJECT_ID('JobCosts', 'U') IS NOT NULL DROP TABLE JobCosts;

-- Create table
CREATE TABLE JobCosts (
    JobFamily VARCHAR(50),
    Region VARCHAR(20),  -- 'India' or 'International'
    Cost FLOAT
);

-- Insert sample data
INSERT INTO JobCosts VALUES ('IT', 'India', 40000);
INSERT INTO JobCosts VALUES ('IT', 'International', 60000);
INSERT INTO JobCosts VALUES ('HR', 'India', 70000);
INSERT INTO JobCosts VALUES ('HR', 'International', 30000);
INSERT INTO JobCosts VALUES ('Finance', 'India', 50000);
INSERT INTO JobCosts VALUES ('Finance', 'International', 50000);
INSERT INTO JobCosts VALUES ('Marketing', 'India', 25000);
INSERT INTO JobCosts VALUES ('Marketing', 'International', 75000);

-- Final Query: Calculate region-wise cost percentage by job family
SELECT 
    JobFamily,
    ROUND(SUM(CASE WHEN Region = 'India' THEN Cost ELSE 0 END) * 100.0 / SUM(Cost), 2) AS India_Percent,
    ROUND(SUM(CASE WHEN Region = 'International' THEN Cost ELSE 0 END) * 100.0 / SUM(Cost), 2) AS International_Percent
FROM 
    JobCosts
GROUP BY 
    JobFamily;
