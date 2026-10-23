

SELECT 
    HOST_ID,
    replace(HOST_NAME, ' ', '_') AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    case 
        WHEN RESPONSE_RATE > 95 then 'Excellent'
        WHEN RESPONSE_RATE > 90 then 'Good'
        WHEN RESPONSE_RATE > 80 then 'Average'
        ELSE 'Poor' 
    END AS RESPONSE_RATE_CATEGORY,
    CREATED_AT
FROM abnb.bronze.bronze_hosts

    WHERE CREATED_AT > (SELECT COALESCE(MAX(CREATED_AT), '1900-01-01') FROM abnb.silver.silver_hosts)
