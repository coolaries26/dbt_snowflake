
-- Return one row per listing with a missing host; dbt passes when this returns no rows.
SELECT LISTING_ID, HOST_ID
FROM abnb.bronze.bronze_listings
WHERE HOST_ID IS NULL