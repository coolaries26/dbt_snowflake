
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LISTING_ID
from abnb.STAGING.LISTINGS
where LISTING_ID is null



  
  
      
    ) dbt_internal_test