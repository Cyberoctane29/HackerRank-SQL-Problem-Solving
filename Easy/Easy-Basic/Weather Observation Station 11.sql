-- Problem: Weather Observation Station 11
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
-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
-- Your result cannot contain duplicates.

-- Solution 1: Using Regular Expressions
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '^[aeiou].*[aeiou]$';

-- Intuition:
-- I want to filter out cities that do not start and end with vowels at the same time. 
-- By using a regular expression, I can match these criteria efficiently.

-- Explanation:
-- 1. I use `SELECT DISTINCT` to ensure only unique city names are returned.
-- 2. The `NOT REGEXP` condition excludes cities whose names both start and end with vowels.
-- 3. The pattern '^[aeiou].*[aeiou]$' matches city names that start and end with vowels, and `NOT` removes them from the result.

-- Solution 2: Using the LIKE Operator
SELECT DISTINCT CITY 
FROM STATION 
WHERE 
    CITY NOT LIKE 'a%' AND 
    CITY NOT LIKE 'e%' AND 
    CITY NOT LIKE 'i%' AND 
    CITY NOT LIKE 'o%' AND 
    CITY NOT LIKE 'u%'
OR 
    CITY NOT LIKE '%a' AND 
    CITY NOT LIKE '%e' AND 
    CITY NOT LIKE '%i' AND 
    CITY NOT LIKE '%o' AND 
    CITY NOT LIKE '%u';

-- Intuition:
-- I need to find city names that either do not start with vowels or do not end with vowels. 
-- Using multiple `NOT LIKE` conditions gives me precise control over the filtering logic.

-- Explanation:
-- 1. I use `SELECT DISTINCT` to ensure the query returns only unique city names.
-- 2. The `WHERE` clause applies two sets of conditions:
--    - The first part ensures that the city name does not start with any vowel using `NOT LIKE`.
--    - The second part ensures that the city name does not end with any vowel.
-- 3. I combine these conditions using `OR` to include cities that meet at least one of these criteria.
