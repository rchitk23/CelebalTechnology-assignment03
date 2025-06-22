-- Step 1: Drop existing table
IF OBJECT_ID('SwapTest', 'U') IS NOT NULL DROP TABLE SwapTest;

-- Step 2: Create the table
CREATE TABLE SwapTest (
    id INT PRIMARY KEY,
    col1 VARCHAR(50),
    col2 VARCHAR(50)
);

-- Step 3: Insert sample data
INSERT INTO SwapTest VALUES 
(1, 'A', 'B'),
(2, 'C', 'D'),
(3, 'X', 'Y');

-- Step 4: View before swap
SELECT * FROM SwapTest;

-- Step 5: First update — merge both into col1
UPDATE SwapTest
SET col1 = col1 + col2;

-- Step 6: Second update — extract swapped values
UPDATE SwapTest
SET 
    col2 = LEFT(col1, LEN(col1) - LEN(col2)),
    col1 = RIGHT(col1, LEN(col2));

-- Step 7: View after swap
SELECT * FROM SwapTest;
