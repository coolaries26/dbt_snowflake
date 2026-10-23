with __dbt__cte__host as (


with host as (
    SELECT 
    hosts_HOST_ID AS HOST_ID,
    HOST_NAME AS HOST_NAME,
    HOST_SINCE AS HOST_SINCE,
    IS_SUPERHOST AS IS_SUPERHOST,
    RESPONSE_RATE_CATEGORY AS RESPONSE_RATE_CATEGORY,
    HOST_CREATED_AT AS CREATED_AT
    FROM abnb.gold.obt
)SELECT * FROM host
) select * from __dbt__cte__host