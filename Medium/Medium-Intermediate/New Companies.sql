-- Problem: New Companies
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Company
-- +---------------+--------+
-- | Column        | Type   |
-- +---------------+--------+
-- | company_code  | String |
-- | founder       | String |
-- +---------------+--------+

-- Table: Lead_Manager
-- +--------------------+--------+
-- | Column             | Type   |
-- +--------------------+--------+
-- | lead_manager_code  | String |
-- | company_code       | String |
-- +--------------------+--------+

-- Table: Senior_Manager
-- +---------------------+--------+
-- | Column              | Type   |
-- +---------------------+--------+
-- | senior_manager_code | String |
-- | lead_manager_code   | String |
-- | company_code        | String |
-- +---------------------+--------+

-- Table: Manager
-- +---------------+--------+
-- | Column        | Type   |
-- +---------------+--------+
-- | manager_code  | String |
-- | senior_manager_code | String |
-- | lead_manager_code | String |
-- | company_code | String |
-- +---------------+--------+

-- Table: Employee
-- +---------------+--------+
-- | Column        | Type   |
-- +---------------+--------+
-- | employee_code | String |
-- | manager_code  | String |
-- | senior_manager_code | String |
-- | lead_manager_code | String |
-- | company_code  | String |
-- +---------------+--------+

-- Problem Statement:
-- The goal is to print details of each company in the following order:
-- 1. Company code and founder name
-- 2. Total count of lead managers, senior managers, managers, and employees for each company.
-- The results should be ordered by the `company_code`.

-- Table Hierarchy:
--  Founder
--    |
--   \/
-- Lead Manager
--    |
--   \/
-- Senior Manager
--    |
--   \/
-- Manager
--    |
--   \/
-- Employee

-- Solution 1 

SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT m.manager_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM 
    Company AS c
JOIN 
    Lead_Manager AS lm ON c.company_code = lm.company_code
JOIN 
    Senior_Manager AS sm ON c.company_code = sm.company_code
JOIN 
    Manager AS m ON c.company_code = m.company_code
JOIN 
    Employee AS e ON c.company_code = e.company_code
GROUP BY 
    c.company_code, c.founder
ORDER BY 
    c.company_code;

-- Intuition for Solution 1:
-- By joining each hierarchical table (`Lead_Manager`, `Senior_Manager`, `Manager`, `Employee`) directly to `Company` based on `company_code`, 
-- I count each unique role per company. This approach allows me to handle the counts without considering the direct hierarchy between each management level.

-- Explanation for Solution 1:
-- JOIN Operations: Each join connects the Company table with its respective managerial tables based on the company_code.
-- COUNT(DISTINCT): This ensures that each manager is counted only once, even if there are duplicates in the tables.
-- GROUP BY: The results are grouped by company_code and founder to provide the required aggregated counts for each company.
-- ORDER BY: Finally, the results are sorted by company_code to maintain an organized output.

-- Solution 2

SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT m.manager_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM 
    Company AS c
JOIN 
    Lead_Manager AS lm ON c.company_code = lm.company_code
JOIN 
    Senior_Manager AS sm ON lm.company_code = sm.company_code
JOIN 
    Manager AS m ON sm.company_code = m.company_code
JOIN 
    Employee AS e ON m.company_code = e.company_code
GROUP BY 
    c.company_code, c.founder
ORDER BY 
    c.company_code;

-- Intuition for Solution 2:
-- By sequentially joining each table according to the hierarchy, I maintain the relationships among each level.
-- This solution accurately reflects the structure by joining from `Lead_Manager` to `Senior_Manager`, then to `Manager`, and finally to `Employee`,
-- ensuring I capture each role’s position within the hierarchy.

-- Explanation for Solution 2:
-- JOIN Operations: The joins are structured to reflect the hierarchy. For example, the Senior_Manager table is joined using the lead_manager_code and company_code, which accurately captures the relationship between senior managers and their lead managers.
-- COUNT(DISTINCT): Similar to the first solution, it ensures unique counts of managers at each level.
-- GROUP BY: Aggregation is performed by company, ensuring accurate counts per company.
-- ORDER BY: Sorting is maintained by company_code for clarity in results.

