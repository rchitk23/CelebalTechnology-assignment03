-- Drop existing tables if they exist
IF OBJECT_ID('Employee', 'U') IS NOT NULL DROP TABLE Employee;
IF OBJECT_ID('Manager', 'U') IS NOT NULL DROP TABLE Manager;
IF OBJECT_ID('Senior_Manager', 'U') IS NOT NULL DROP TABLE Senior_Manager;
IF OBJECT_ID('Lead_Manager', 'U') IS NOT NULL DROP TABLE Lead_Manager;
IF OBJECT_ID('Company', 'U') IS NOT NULL DROP TABLE Company;

-- Create Tables
CREATE TABLE Company (
    company_code VARCHAR(10),
    founder VARCHAR(50)
);

CREATE TABLE Lead_Manager (
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

CREATE TABLE Senior_Manager (
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

CREATE TABLE Manager (
    manager_code VARCHAR(10),
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

CREATE TABLE Employee (
    employee_code VARCHAR(10),
    manager_code VARCHAR(10),
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

-- Insert Sample Data
INSERT INTO Company VALUES ('C1', 'Monika');
INSERT INTO Company VALUES ('C2', 'Samantha');

INSERT INTO Lead_Manager VALUES ('LM1', 'C1');
INSERT INTO Lead_Manager VALUES ('LM2', 'C2');

INSERT INTO Senior_Manager VALUES ('SM1', 'LM1', 'C1');
INSERT INTO Senior_Manager VALUES ('SM2', 'LM1', 'C1');
INSERT INTO Senior_Manager VALUES ('SM3', 'LM2', 'C2');

INSERT INTO Manager VALUES ('M1', 'SM1', 'LM1', 'C1');
INSERT INTO Manager VALUES ('M2', 'SM3', 'LM2', 'C2');
INSERT INTO Manager VALUES ('M3', 'SM3', 'LM2', 'C2');

INSERT INTO Employee VALUES ('E1', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO Employee VALUES ('E2', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO Employee VALUES ('E3', 'M2', 'SM3', 'LM2', 'C2');
INSERT INTO Employee VALUES ('E4', 'M3', 'SM3', 'LM2', 'C2');

-- Final Query to Get Required Output
SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_count,
    COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_count,
    COUNT(DISTINCT m.manager_code) AS manager_count,
    COUNT(DISTINCT e.employee_code) AS employee_count
FROM 
    Company c
LEFT JOIN 
    Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN 
    Senior_Manager sm ON c.company_code = sm.company_code
LEFT JOIN 
    Manager m ON c.company_code = m.company_code
LEFT JOIN 
    Employee e ON c.company_code = e.company_code
GROUP BY 
    c.company_code, c.founder
ORDER BY 
    c.company_code;
