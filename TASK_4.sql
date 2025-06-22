
IF OBJECT_ID('submission_stats') IS NOT NULL DROP TABLE submission_stats;
IF OBJECT_ID('view_stats') IS NOT NULL DROP TABLE view_stats;
IF OBJECT_ID('challenges') IS NOT NULL DROP TABLE challenges;
IF OBJECT_ID('colleges') IS NOT NULL DROP TABLE colleges;
IF OBJECT_ID('contests') IS NOT NULL DROP TABLE contests;

CREATE TABLE contests (
    contest_id INT PRIMARY KEY,
    hacker_id INT,
    name VARCHAR(100)
);

CREATE TABLE colleges (
    college_id INT PRIMARY KEY,
    contest_id INT FOREIGN KEY REFERENCES contests(contest_id)
);

CREATE TABLE challenges (
    challenge_id INT PRIMARY KEY,
    college_id INT FOREIGN KEY REFERENCES colleges(college_id)
);

CREATE TABLE view_stats (
    challenge_id INT PRIMARY KEY,
    total_views INT,
    total_unique_views INT
);

CREATE TABLE submission_stats (
    challenge_id INT PRIMARY KEY,
    total_submissions INT,
    total_accepted_submissions INT
);


INSERT INTO contests VALUES 
(66406, 17973, 'Rose'),
(66556, 79153, 'Angela'),
(94828, 80275, 'Frank');


INSERT INTO colleges VALUES
(1, 66406),
(2, 66556),
(3, 94828);


INSERT INTO challenges VALUES
(101, 1),
(102, 2),
(103, 3);


INSERT INTO view_stats VALUES
(101, 264, 188),
(102, 292, 222),
(103, 208, 186);


INSERT INTO submission_stats VALUES
(101, 1114, 156),
(102, 1026, 184),
(103, 1301, 117);


SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    SUM(ISNULL(ss.total_submissions, 0)) AS total_submissions,
    SUM(ISNULL(ss.total_accepted_submissions, 0)) AS total_accepted_submissions,
    SUM(ISNULL(vs.total_views, 0)) AS total_views,
    SUM(ISNULL(vs.total_unique_views, 0)) AS total_unique_views
FROM contests c
JOIN colleges co ON c.contest_id = co.contest_id
JOIN challenges ch ON co.college_id = ch.college_id
LEFT JOIN view_stats vs ON ch.challenge_id = vs.challenge_id
LEFT JOIN submission_stats ss ON ch.challenge_id = ss.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING 
    SUM(ISNULL(ss.total_submissions, 0)) != 0 OR 
    SUM(ISNULL(ss.total_accepted_submissions, 0)) != 0 OR 
    SUM(ISNULL(vs.total_views, 0)) != 0 OR 
    SUM(ISNULL(vs.total_unique_views, 0)) != 0
ORDER BY c.contest_id;
