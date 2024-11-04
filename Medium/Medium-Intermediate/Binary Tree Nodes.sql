-- Problem: Binary Tree Nodes
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: BST
-- +--------+--------+
-- | Column | Type   |
-- +--------+--------+
-- | N      | Integer|
-- | P      | Integer|
-- +--------+--------+

-- Problem Statement
-- Determine the type of each node in the binary tree: 
-- 1. "Root" if the node is a root (i.e., has no parent, P IS NULL).
-- 2. "Leaf" if the node has no children (i.e., its value does not appear as any node's parent).
-- 3. "Inner" if the node has both a parent and at least one child.

SELECT 
    N, 
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS NodeType
FROM 
    BST
ORDER BY 
    N;

-- Intuition:
-- I need to determine the type of each node by examining its parent-child relationships.
-- Specifically, the characteristics of root, leaf, and inner nodes depend on their presence 
-- as parents or children in the tree.

-- Explanation:
-- 1. `P IS NULL`: This condition identifies root nodes because a root node has no parent.
-- 2. `N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL)`: This subquery identifies leaf nodes by selecting nodes 
--    that do not appear in the `P` column, meaning they are not parents to any other nodes.
-- 3. All other nodes that do not meet either of the above conditions are considered inner nodes.
-- 4. `ORDER BY N` sorts the output by node value, as required.
