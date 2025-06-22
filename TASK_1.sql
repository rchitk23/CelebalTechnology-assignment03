-- Create table
CREATE TABLE Projects (
    Task_ID INT,
    Start_Date DATE,
    End_Date DATE
);

-- Insert data
INSERT INTO Projects (Task_ID, Start_Date, End_Date) VALUES
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');

-- Main query to group tasks into projects and output required result
WITH TaskGroups AS (
    SELECT *,
           DATEADD(DAY, -ROW_NUMBER() OVER (ORDER BY Start_Date), Start_Date) AS grp
    FROM Projects
),
ProjectsGrouped AS (
    SELECT 
        MIN(Start_Date) AS start_date,
        MAX(End_Date) AS end_date,
        DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)) + 1 AS duration
    FROM TaskGroups
    GROUP BY grp
)
SELECT start_date, end_date
FROM ProjectsGrouped
ORDER BY duration, start_date;
 