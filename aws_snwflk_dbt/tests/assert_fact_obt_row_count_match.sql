
WITH row_counts AS (
    SELECT
        (SELECT COUNT(*) FROM {{ ref('obt') }}) AS obt_count,
        (SELECT COUNT(*) FROM {{ ref('fact') }}) AS fact_count
)

SELECT *
FROM row_counts
WHERE obt_count <> fact_count
