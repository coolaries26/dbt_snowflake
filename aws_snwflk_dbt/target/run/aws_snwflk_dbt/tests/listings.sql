
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
-- Return one row per listing with a missing host; dbt passes when this returns no rows.
SELECT LISTING_ID, HOST_ID
FROM abnb.bronze.bronze_listings
WHERE HOST_ID IS NULL
  
  
      
    ) dbt_internal_test