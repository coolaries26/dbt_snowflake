
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT *
FROM abnb.silver.silver_hosts
WHERE RESPONSE_RATE_CATEGORY NOT IN (
    'Excellent',
    'Good',
    'Average',
    'Poor'
)
OR RESPONSE_RATE_CATEGORY IS NULL
  
  
      
    ) dbt_internal_test