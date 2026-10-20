{{config (
    severity='WARN',
    tags=['dbt_abnb', 'listings', 'bronze', 'host_id'],
    description='Check for null host_ids in the listings table'
)}}
-- Return one row per listing with a missing host; dbt passes when this returns no rows.
SELECT LISTING_ID, HOST_ID
FROM {{ ref('bronze_listings') }}
WHERE HOST_ID IS NULL
