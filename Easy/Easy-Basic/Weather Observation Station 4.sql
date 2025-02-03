-- Problem: Weather Observation Station 4
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: STATION
-- +------------+------------+
-- | Column     | Type       |
-- +------------+------------+
-- | ID         | NUMBER     |
-- | CITY       | VARCHAR2(21)|
-- | STATE      | VARCHAR2(2) |
-- | LAT_N      | NUMBER     |
-- | LONG_W     | NUMBER     |
-- +------------+------------+

-- Problem Statement
-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

-- Solution 1: Using COUNT with CITY and DISTINCT CITY
SELECT 
    (COUNT(CITY) - COUNT(DISTINCT CITY)) AS ANS 
FROM STATION;

-- Intuition for Solution 1:
-- I use the `COUNT()` function to calculate the total number of CITY entries in the `STATION` table and the number of distinct CITY entries.
-- The difference between these two values gives the answer.

-- Explanation for Solution 1:
-- `COUNT(CITY)` counts all entries in the CITY column, including duplicates.
-- `COUNT(DISTINCT CITY)` counts only unique city entries, excluding duplicates.
-- The difference between the two counts gives the number of duplicate CITY entries.

-- Solution 2: Using Subqueries with COUNT for CITY and DISTINCT CITY
SELECT ((SELECT COUNT(CITY) FROM STATION) - (SELECT COUNT(DISTINCT CITY) FROM STATION)) AS ANS 
LIMIT 1;

-- Intuition for Solution 2:
-- I use two separate subqueries to count the total number of CITY entries and the number of distinct CITY entries, then subtract the latter from the former.
-- This approach works similarly to Solution 1 but with subqueries.

-- Explanation for Solution 2:
-- The first subquery `(SELECT COUNT(CITY) FROM STATION)` calculates the total number of CITY entries.
-- The second subquery `(SELECT COUNT(DISTINCT CITY) FROM STATION)` calculates the number of distinct CITY entries.
-- The difference between these values gives the desired result, and `LIMIT 1` ensures only a single row is returned.

-- Solution 3: Using Subqueries Without LIMIT
SELECT 
    (SELECT COUNT(CITY) FROM STATION) - (SELECT COUNT(DISTINCT CITY) FROM STATION) AS ANS;

-- Intuition for Solution 3:
-- This solution is similar to Solution 2, except it does not include the `LIMIT` clause. Since the query only returns one value, there's no need to limit the result.

-- Explanation for Solution 3:
-- Just like Solution 2, the query uses two subqueries to calculate the counts of CITY and DISTINCT CITY.
-- The difference is returned as the result, without the need for the `LIMIT` clause.

-- Solution 4: Using a Subquery with MAX
SELECT MAX(ANS) AS ANS
FROM (
    SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS ANS 
    FROM STATION
) AS subquery;

-- Intuition for Solution 4:
-- I use a subquery to calculate the difference between the total number of CITY entries and the number of distinct CITY entries.
-- `MAX(ANS)` is used to ensure the query returns a single value, even though there is only one value being calculated.

-- Explanation for Solution 4:
-- The subquery calculates the difference between the total and distinct CITY counts.
-- The `MAX()` function is applied to ensure that only one result is returned, although this is unnecessary in this case since the subquery only produces one row.

-- Solution 5: Using a Nested Subquery with MAX
SELECT MAX(
    (SELECT COUNT(CITY) FROM STATION) - (SELECT COUNT(DISTINCT CITY) FROM STATION)
) AS ANS 
FROM STATION;

-- Intuition for Solution 5:
-- I use a nested subquery to calculate the difference between the total number of CITY entries and the number of distinct CITY entries, then apply `MAX()` to return a single result.

-- Explanation for Solution 5:
-- The inner subquery calculates the difference between the total and distinct CITY counts.
-- The `MAX()` function is used to return the result as a single value, although it is unnecessary in this case.
