
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select BOOKING_ID
from abnb.STAGING.BOOKINGS
where BOOKING_ID is null



  
  
      
    ) dbt_internal_test