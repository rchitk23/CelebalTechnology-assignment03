
IF OBJECT_ID('Packages', 'U') IS NOT NULL DROP TABLE Packages;
IF OBJECT_ID('Friends', 'U') IS NOT NULL DROP TABLE Friends;
IF OBJECT_ID('Students', 'U') IS NOT NULL DROP TABLE Students;

CREATE TABLE Students (
    ID INT,
    Name VARCHAR(50)
);

CREATE TABLE Friends (
    ID INT,
    Friend_ID INT
);

CREATE TABLE Packages (
    ID INT,
    Salary FLOAT
);

INSERT INTO Students VALUES (1, 'Ashley');
INSERT INTO Students VALUES (2, 'Samantha');
INSERT INTO Students VALUES (3, 'Julia');
INSERT INTO Students VALUES (4, 'Scarlet');

INSERT INTO Friends VALUES (1, 2);
INSERT INTO Friends VALUES (2, 3);
INSERT INTO Friends VALUES (3, 4);
INSERT INTO Friends VALUES (4, 1);

INSERT INTO Packages VALUES (1, 15.20);
INSERT INTO Packages VALUES (2, 10.06);
INSERT INTO Packages VALUES (3, 11.55);
INSERT INTO Packages VALUES (4, 12.12);

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages p1 ON s.ID = p1.ID
JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;
