-- Problem: Weather Observation Station 10
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
-- The STATION table stores information about weather stations, including their city, state, latitude, and longitude.
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

-- Solution 1: Using Regular Expressions
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[^aeiou]$';

-- Intuition:
-- I want to retrieve all unique city names that do not end with a vowel. 
-- Using a regular expression allows me to easily match names that do not have a vowel as their last character.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement ensures that only unique city names are returned.
-- 2. In the `WHERE` clause, the `REGEXP` function is used with the pattern '[^aeiou]$' to match city names whose last character is not a vowel.
-- 3. The `^` inside the square brackets negates the vowels, and the `$` ensures we are matching only the last character.

-- Solution 2: Using the LIKE Operator
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT LIKE '%a'
  AND CITY NOT LIKE '%e'
  AND CITY NOT LIKE '%i'
  AND CITY NOT LIKE '%o'
  AND CITY NOT LIKE '%u';

-- Intuition:
-- I want to obtain a list of unique city names that do not end with any vowel. 
-- Using the `LIKE` operator provides a straightforward way to specify the exclusion criteria for each vowel.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement ensures that only unique city names are included in the result.
-- 2. The `WHERE` clause applies multiple conditions using the `NOT LIKE` operator to exclude city names ending with 'a', 'e', 'i', 'o', or 'u'.
-- 3. These conditions are combined with the `AND` operator, ensuring that only cities that end with consonants are returned.
