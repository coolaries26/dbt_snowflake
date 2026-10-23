
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select HOST_ID
from abnb.bronze.bronze_listings
where HOST_ID is null



  
  
      
    ) dbt_internal_test