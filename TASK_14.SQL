IF OBJECT_ID('Employees', 'U') IS NOT NULL DROP TABLE Employees;


CREATE TABLE Employees (
    ID INT,
    SubBand VARCHAR(10)
);

INSERT INTO Employees VALUES (1, 'A1');
INSERT INTO Employees VALUES (2, 'A1');
INSERT INTO Employees VALUES (3, 'A1');
INSERT INTO Employees VALUES (4, 'B1');
INSERT INTO Employees VALUES (5, 'B1');
INSERT INTO Employees VALUES (6, 'C1');
INSERT INTO Employees VALUES (7, 'C1');
INSERT INTO Employees VALUES (8, 'C1');
INSERT INTO Employees VALUES (9, 'C1');
INSERT INTO Employees VALUES (10, 'C1');

SELECT 
    SubBand,
    COUNT(*) AS Headcount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM 
    Employees
GROUP BY SubBand;
