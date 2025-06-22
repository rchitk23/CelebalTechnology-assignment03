-- Drop EMPLOYEES table if it already exists
IF OBJECT_ID('dbo.EMPLOYEES', 'U') IS NOT NULL
    DROP TABLE dbo.EMPLOYEES;

-- Create table with 'salary' column
CREATE TABLE dbo.EMPLOYEES (
    salary INT
);

INSERT INTO dbo.EMPLOYEES (salary)
VALUES 
(100),
(200),
(103),
(500),
(1200),
(3050),
(400),
(799);

SELECT 
    CEILING(
        AVG(CAST(salary AS FLOAT)) - 
        AVG(CAST(REPLACE(CAST(salary AS VARCHAR), '0', '') AS FLOAT))
    ) AS error_amount
FROM dbo.EMPLOYEES;




