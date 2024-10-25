-- Problem: Type of Triangle
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: TRIANGLES
-- +--------------+---------+
-- | Column       | Type    |
-- +--------------+---------+
-- | A            | Integer |
-- | B            | Integer |
-- | C            | Integer |
-- +--------------+---------+
-- Each row in the TRIANGLES table denotes the lengths of each side of a triangle.

-- Problem Statement
-- Write a query to identify the type of each triangle based on its three side lengths. 
-- Output one of the following statements for each record in the table:
-- - Equilateral: It's a triangle with sides of equal length.
-- - Isosceles: It's a triangle with two sides of equal length.
-- - Scalene: It's a triangle with all sides of differing lengths.
-- - Not A Triangle: The given values of A, B, and C don't form a triangle.

-- Solution
SELECT 
    CASE 
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        WHEN A != B AND B != C AND A != C THEN 'Scalene'
        ELSE 'INVALID'
    END AS result 
FROM TRIANGLES;

-- Intuition:
-- I need to classify each set of triangle sides based on their lengths. 
-- By applying conditions that check the relationships between the sides, 
-- I can determine the type of triangle or if the values do not form a triangle.

-- Explanation:
-- 1. The `CASE` statement evaluates the conditions in order:
--    - The first condition checks if the sum of any two sides is less than or equal to the third side, which indicates that it cannot form a triangle.
--    - The second condition checks if all three sides are equal, which identifies an equilateral triangle.
--    - The third condition checks for two equal sides, classifying it as isosceles.
--    - The fourth condition checks that all sides are different, identifying it as scalene.
-- 2. The result is returned as a single column labeled `result`, containing the appropriate classification for each triangle.
