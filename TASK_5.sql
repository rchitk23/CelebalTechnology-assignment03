IF OBJECT_ID('Submissions') IS NOT NULL DROP TABLE Submissions;
IF OBJECT_ID('Hackers') IS NOT NULL DROP TABLE Hackers;


CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE Submissions (
    submission_date DATE,
    submission_id INT,
    hacker_id INT,
    score INT
);


INSERT INTO Hackers VALUES
(15758, 'Rose'),
(20703, 'Angela'),
(36396, 'Frank'),
(38289, 'Patrick'),
(44065, 'Lisa'),
(53473, 'Kimberly'),
(62529, 'Bonnie'),
(79722, 'Michael');


INSERT INTO Submissions VALUES 
('2016-03-01',  8494,  20703,  0),
('2016-03-01', 22403,  53473, 15),
('2016-03-01', 23965,  79722, 60),
('2016-03-01', 30173,  36396, 70),
('2016-03-02', 34928,  20703,  0),
('2016-03-02', 38740,  15758, 60),
('2016-03-02', 42769,  79722, 25),
('2016-03-02', 44364,  79722, 60),
('2016-03-02', 45440,  20703,  0),
('2016-03-03', 49050,  36396, 70),
('2016-03-03', 50273,  79722,  5),
('2016-03-04', 50344,  20703,  0),
('2016-03-04', 51360,  44065, 90),
('2016-03-04', 54404,  53473, 65),
('2016-03-04', 61533,  79722, 45),
('2016-03-05', 72852,  20703,  0),
('2016-03-05', 74546,  38289, 65),
('2016-03-05', 76487,  62529,  0),
('2016-03-05', 82439,  36396, 10),
('2016-03-05', 90006,  36396, 40),
('2016-03-06', 90404,  20703,  0);


SELECT 
    d.submission_date,
    COUNT(DISTINCT s.hacker_id) AS total_unique_hackers,
    h.hacker_id,
    h.name
FROM 
    (SELECT DISTINCT submission_date FROM Submissions) d
JOIN 
    (
        SELECT 
            submission_date,
            hacker_id,
            COUNT(*) AS total_subs,
            RANK() OVER (PARTITION BY submission_date ORDER BY COUNT(*) DESC, hacker_id ASC) AS rnk
        FROM Submissions
        GROUP BY submission_date, hacker_id
    ) ms ON d.submission_date = ms.submission_date AND ms.rnk = 1
JOIN 
    Hackers h ON ms.hacker_id = h.hacker_id
JOIN 
    Submissions s ON d.submission_date = s.submission_date
GROUP BY d.submission_date, h.hacker_id, h.name
ORDER BY d.submission_date;
