-- Recursive CTE to generate numbers from 2 to 1000
WITH Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n + 1 <= 1000
),
-- Filter primes using NOT EXISTS
Primes AS (
    SELECT n
    FROM Numbers AS outer_n
    WHERE NOT EXISTS (
        SELECT 1
        FROM Numbers AS inner_n
        WHERE inner_n.n < outer_n.n AND inner_n.n > 1 AND outer_n.n % inner_n.n = 0
    )
)
-- Final output with ampersand separator
SELECT STRING_AGG(CAST(n AS VARCHAR), '&') AS PrimeNumbers
FROM Primes
OPTION (MAXRECURSION 1000);
