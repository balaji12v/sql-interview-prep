-- Problem: Rank Scores (LeetCode 178)

-- Pattern: Window Function

-- Approach:
-- 1. Use DENSE_RANK() to assign ranks
-- why dense_rank() because these will not skip the number after a tie
-- 2. Order scores in descending order
-- 3. No gaps in ranking

SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores;

-- Time Complexity: O(n log n) (due to sorting)
-- Space Complexity: O(1)
