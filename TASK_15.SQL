-- Step 1: Drop if exists
IF OBJECT_ID('Employee', 'U') IS NOT NULL 
    DROP TABLE Employee;

-- Step 2: Create table
CREATE TABLE Employee (
    emp_id INT NOT NULL,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

-- Step 3: Insert data
INSERT INTO Employee (emp_id, emp_name, salary)
VALUES 
    (1, 'Alice', 55000.00),
    (2, 'Bob', 72000.00),
    (3, 'Charlie', 68000.00),
    (4, 'David', 60000.00),
    (5, 'Eve', 79000.00),
    (6, 'Frank', 65000.00),
    (7, 'Grace', 62000.00),
    (8, 'Heidi', 74000.00),
    (9, 'Ivan', 58000.00),
    (10, 'Judy', 70000.00);
    
SELECT DISTINCT E1.emp_id, E1.emp_name, E1.salary
FROM Employee E1
WHERE (
    SELECT COUNT(DISTINCT E2.salary)
    FROM Employee E2
    WHERE E2.salary > E1.salary
) < 5;