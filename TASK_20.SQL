DROP TABLE IF EXISTS SourceTable;
DROP TABLE IF EXISTS TargetTable;

CREATE TABLE SourceTable (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

CREATE TABLE TargetTable (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO SourceTable (id, name, age) VALUES
(1, 'Alice', 25),
(2, 'Bob', 30),
(3, 'Charlie', 28),
(4, 'Diana', 22);

INSERT INTO TargetTable (id, name, age) VALUES
(1, 'Alice', 25),
(3, 'Charlie', 28);

INSERT INTO TargetTable (id, name, age)
SELECT s.id, s.name, s.age
FROM SourceTable s
LEFT JOIN TargetTable t ON s.id = t.id
WHERE t.id IS NULL;

SELECT * FROM TargetTable ORDER BY id;
