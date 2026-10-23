SELECT *
FROM abnb.silver.silver_hosts
WHERE RESPONSE_RATE_CATEGORY NOT IN (
    'Excellent',
    'Good',
    'Average',
    'Poor'
)
OR RESPONSE_RATE_CATEGORY IS NULL