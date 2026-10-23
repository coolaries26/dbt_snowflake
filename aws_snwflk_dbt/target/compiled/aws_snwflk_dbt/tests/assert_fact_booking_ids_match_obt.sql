WITH obt_ids AS (
    SELECT BOOKINGS_BOOKING_ID AS BOOKING_ID
    FROM abnb.gold.obt
),
fact_ids AS (
    SELECT BOOKING_ID
    FROM abnb.gold.fact
)

SELECT
    'MISSING_IN_FACT' AS issue,
    obt_ids.BOOKING_ID
FROM obt_ids
WHERE NOT EXISTS (
    SELECT 1
    FROM fact_ids
    WHERE fact_ids.BOOKING_ID = obt_ids.BOOKING_ID
)

UNION ALL

SELECT
    'EXTRA_IN_FACT' AS issue,
    fact_ids.BOOKING_ID
FROM fact_ids
WHERE NOT EXISTS (
    SELECT 1
    FROM obt_ids
    WHERE obt_ids.BOOKING_ID = fact_ids.BOOKING_ID
)