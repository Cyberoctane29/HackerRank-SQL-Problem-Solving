-- Problem: Population Census
-- Difficulty: Easy
-- Skills: SQL (Basic)
-- SQL Schema
-- Table: CITY
-- +-------------+--------------+
-- | Column      | Type         |
-- +-------------+--------------+
-- | ID          | NUMBER       |
-- | NAME        | VARCHAR2(17) |
-- | COUNTRYCODE | VARCHAR2(3)  |
-- | DISTRICT    | VARCHAR2(20) |
-- | POPULATION  | NUMBER       |
-- +-------------+--------------+

-- Table: COUNTRY
-- +--------------+--------------+
-- | Column       | Type         |
-- +--------------+--------------+
-- | CODE         | VARCHAR2(3)  |
-- | NAME         | VARCHAR2(44) |
-- | CONTINENT    | VARCHAR2(13) |
-- | REGION       | VARCHAR2(25) |
-- | SURFACEAREA  | NUMBER       |
-- | INDEPYEAR    | VARCHAR2(5)  |
-- | POPULATION   | NUMBER       |
-- | LIFEEXPECTANCY | VARCHAR2(4)|
-- | GNP          | NUMBER       |
-- | GNPOLD       | VARCHAR2(9)  |
-- | LOCALNAME    | VARCHAR2(44) |
-- | GOVERNMENTFORM| VARCHAR2(44)|
-- | HEADOFSTATE  | VARCHAR2(32) |
-- | CAPITAL      | VARCHAR2(4)  |
-- | CODE2        | VARCHAR2(2)  |
-- +--------------+--------------+

-- Problem Statement
-- Query the names of all cities where the CONTINENT is 'Africa'.
-- The CITY.CountryCode and COUNTRY.Code columns form a matching key.

-- Solution
SELECT 
    c.NAME AS city 
FROM 
    CITY AS c 
JOIN 
    COUNTRY AS co 
ON 
    c.COUNTRYCODE = co.CODE 
WHERE 
    co.CONTINENT = 'Africa';

-- Intuition:
-- I need to extract the names of cities that belong to countries located on the African continent.
-- Since city data and country data are split across two tables, I use a `JOIN` on matching key columns.

-- Explanation:
-- 1. Perform an `INNER JOIN` between CITY and COUNTRY using `COUNTRYCODE` and `CODE`.
-- 2. Use a `WHERE` clause to filter for rows where the continent is 'Africa'.
-- 3. Select only the `NAME` column from the CITY table and alias it as `city` for clear output.
