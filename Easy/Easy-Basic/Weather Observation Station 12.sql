-- Problem: Weather Observation Station 12
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: STATION
-- +--------+--------------+
-- | Column | Type         |
-- +--------+--------------+
-- | ID     | NUMBER       |
-- | CITY   | VARCHAR2(21) |
-- | STATE  | VARCHAR2(2)  |
-- | LAT_N  | NUMBER       |
-- | LONG_W | NUMBER       |
-- +--------+--------------+
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
-- Your result cannot contain duplicates.

-- Solution 1: Using Regular Expressions
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$';

-- Intuition:
-- I want to identify city names that neither start nor end with vowels. 
-- By using a regular expression, I can efficiently match names based on the required pattern.

-- Explanation:
-- 1. I use `SELECT DISTINCT` to ensure the result contains only unique city names.
-- 2. The `WHERE` clause uses the `REGEXP` pattern '^[^aeiou].*[^aeiou]$' to filter city names:
--    - `^[^aeiou]` ensures the city name does not start with a vowel.
--    - `.*` allows for any sequence of characters in the middle.
--    - `[^aeiou]$` ensures the city name does not end with a vowel.

-- Solution 2: Using the LIKE Operator
SELECT DISTINCT CITY 
FROM STATION 
WHERE 
    CITY NOT LIKE 'a%' AND 
    CITY NOT LIKE 'e%' AND 
    CITY NOT LIKE 'i%' AND 
    CITY NOT LIKE 'o%' AND 
    CITY NOT LIKE 'u%'
AND 
    CITY NOT LIKE '%a' AND 
    CITY NOT LIKE '%e' AND 
    CITY NOT LIKE '%i' AND 
    CITY NOT LIKE '%o' AND 
    CITY NOT LIKE '%u';

-- Intuition:
-- I need to filter city names that do not start or end with vowels. 
-- Using multiple `NOT LIKE` conditions ensures precise filtering according to the problem requirements.

-- Explanation:
-- 1. I use `SELECT DISTINCT` to avoid duplicate city names in the result.
-- 2. The `WHERE` clause applies two sets of conditions:
--    - The first part ensures that the city name does not start with any vowel.
--    - The second part ensures that the city name does not end with any vowel.
-- 3. I combine the two conditions using `AND` to retrieve city names that meet both criteria.
