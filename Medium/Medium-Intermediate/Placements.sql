-- Problem: Placements
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Students
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | ID           | Integer    |
-- | Name         | String     |
-- +--------------+------------+

-- Table: Friends
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | ID           | Integer    |
-- | Friend_ID    | Integer    |
-- +--------------+------------+

-- Table: Packages
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | ID           | Integer    |
-- | Salary       | Float      |
-- +--------------+------------+

-- Problem Statement
-- Query the names of students whose best friends have a higher salary offer than them.
-- The result should be ordered by the salary offered to the best friends, in ascending order.

-- Solution 1: Using Common Table Expressions (CTEs)
WITH student_table AS (
    SELECT 
        s.id AS student_id1, 
        s.name AS student_name, 
        p.salary AS student_salary
    FROM 
        students s
    JOIN 
        packages p 
    ON 
        s.id = p.id
),
friend_table AS (
    SELECT 
        f.id AS student_id2,
        f.friend_id AS friend_id, 
        p.salary AS friend_salary
    FROM 
        friends f
    JOIN 
        packages p
    ON 
        f.friend_id = p.id
)
SELECT 
    st.student_name
FROM 
    student_table st
JOIN 
    friend_table fr
ON 
    st.student_id1 = fr.student_id2
WHERE
    fr.friend_salary > st.student_salary
ORDER BY 
    fr.friend_salary;

-- Intuition for Solution 1:
-- I use two CTEs to separate the student data and friend data. 
-- The first CTE (`student_table`) fetches the student names and their salary offers, while the second CTE (`friend_table`) fetches the friends' salaries.
-- I then join these CTEs on the student and friend's ID, comparing the friend's salary with the student's salary in the `WHERE` clause.
-- The results are sorted by the friend's salary in ascending order.

-- Explanation for Solution 1:
-- 1. The `student_table` CTE retrieves the student ID, name, and salary by joining the `students` table with the `packages` table.
-- 2. The `friend_table` CTE retrieves the friend’s salary by joining the `friends` table with the `packages` table.
-- 3. I join the two CTEs on the student ID and friend ID and filter the results to only include students whose friend’s salary is higher than theirs.
-- 4. The final result is ordered by the friend's salary in ascending order.

-- Solution 2: Without using explicit CTEs
SELECT 
    st.student_name
FROM 
    (
        SELECT 
            s.id as student_id1, 
            s.name as student_name, 
            p.salary as student_salary
        FROM 
            students s
        JOIN 
            packages p 
        ON 
            s.id = p.id
    ) AS st
JOIN 
    (
        SELECT 
            f.id as student_id2,
            f.friend_id as friend_id, 
            p.salary as friend_salary
        FROM 
            friends f
        JOIN 
            packages p
        ON 
            f.friend_id = p.id
    ) AS fr
ON 
    st.student_id1 = fr.student_id2
WHERE
    fr.friend_salary > st.student_salary
ORDER BY 
    fr.friend_salary;

-- Intuition for Solution 2:
-- This solution follows a similar approach but uses subqueries instead of CTEs.
-- The first subquery retrieves student data (ID, name, and salary), and the second subquery retrieves the friend’s salary.
-- Both subqueries are joined on the student and friend IDs. The `WHERE` clause filters the results to only include students whose friend’s salary is higher than theirs.
-- The result is ordered by the friend’s salary in ascending order.

-- Explanation for Solution 2:
-- 1. The first subquery selects the student's ID, name, and salary by joining `students` and `packages`.
-- 2. The second subquery retrieves the friend's salary by joining `friends` and `packages`.
-- 3. The `ON` clause matches the student with their corresponding best friend, and the `WHERE` clause ensures that the friend’s salary is greater than the student’s salary.
-- 4. The results are sorted by the friend's salary in ascending order.

-- Solution 3: Using direct joins without subqueries or CTEs
SELECT 
    s.name 
FROM 
    students s
JOIN 
    friends f 
    ON s.ID = f.ID
JOIN 
    packages p 
    ON f.ID = p.ID
JOIN 
    packages p1 
    ON f.friend_ID = p1.ID
WHERE 
    p1.salary > p.salary
ORDER BY 
    p1.salary;

-- Intuition for Solution 3:
-- This solution directly joins the `students`, `friends`, and `packages` tables in a single query.
-- The `WHERE` clause ensures that only the students whose best friends have a higher salary are selected.
-- The results are then ordered by the friend's salary in ascending order.

-- Explanation for Solution 3:
-- 1. The query first joins the `students` table with the `friends` table using the `ID` of the student.
-- 2. It then joins the `packages` table twice: once for the student's salary and once for the friend’s salary using their respective IDs.
-- 3. The `WHERE` clause filters the results to only include students whose best friends have a higher salary.
-- 4. The results are sorted by the friend’s salary in ascending order.
