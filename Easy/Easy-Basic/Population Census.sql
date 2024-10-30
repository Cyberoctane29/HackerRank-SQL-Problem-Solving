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
-- Query the sum of populations of all cities where the CONTINENT is 'Asia'. 
-- The CITY.CountryCode and COUNTRY.Code columns form a matching key.

-- Solution
SELECT 
    SUM(c.population) AS population_sum 
FROM 
    CITY AS c 
JOIN 
    COUNTRY AS co 
ON 
    c.COUNTRYCODE = co.CODE 
WHERE 
    co.CONTINENT = 'Asia';

-- Intuition:
-- I need to sum the populations of all cities belonging to countries in the continent 'Asia'.
-- The matching key is CITY.CountryCode with COUNTRY.Code, so a `JOIN` is necessary.
-- Filtering the result to only countries in 'Asia' ensures correct aggregation.

-- Explanation:
-- 1. I perform an `INNER JOIN` between CITY and COUNTRY on matching key columns `COUNTRYCODE` and `CODE`.
-- 2. The `WHERE` clause ensures only cities in Asian countries are included.
-- 3. The `SUM()` function aggregates the total population.
-- 4. I use an alias `population_sum` for clear output formatting.
