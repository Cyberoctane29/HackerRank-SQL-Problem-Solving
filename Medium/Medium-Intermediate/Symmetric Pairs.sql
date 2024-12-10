-- Problem: Symmetric Pairs
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Functions
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | X            | Integer    |
-- | Y            | Integer    |
-- +--------------+------------+

-- Problem Statement
-- Find and list all symmetric pairs in ascending order of X where X1 ≤ Y1.
-- Two pairs (X1, Y1) and (X2, Y2) are symmetric if X1 = Y2 and X2 = Y1.

-- Solution
SELECT first.* 
FROM functions AS first 
JOIN functions AS second 
    ON first.x = second.y AND first.y = second.x
WHERE first.x < first.y

UNION ALL 

SELECT * 
FROM functions 
GROUP BY x, y 
HAVING COUNT(*) > 1
ORDER BY x;

-- Intuition for the Solution:
-- I use a self-join to find pairs where one pair (X1, Y1) has its corresponding symmetric pair (X2, Y2) such that X1 = Y2 and X2 = Y1.
-- The condition `first.x < first.y` ensures that the result only includes symmetric pairs where X1 ≤ Y1.
-- The `UNION ALL` is used to include additional cases where the same pair (X, Y) appears more than once.
-- Finally, the results are ordered by the value of X in ascending order.

-- Explanation:
-- 1. The first part of the query (the `JOIN` operation) checks for symmetric pairs by joining the table with itself.
--    It matches pairs where the X of one row equals the Y of another row, and the Y of the first row equals the X of the second row.
--    The `WHERE first.x < first.y` ensures that only pairs where the first element (X) is less than or equal to the second element (Y) are included.
-- 2. The second part of the query (using `UNION ALL`) ensures that if a pair (X, Y) appears multiple times, it is also included in the result.
--    The `GROUP BY x, y` and `HAVING COUNT(*) > 1` condition filters pairs that appear more than once in the table.
-- 3. The results are ordered by the value of X in ascending order.
