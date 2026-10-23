
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select BOOKINGS_BOOKING_ID
from abnb.gold.obt
where BOOKINGS_BOOKING_ID is null



  
  
      
    ) dbt_internal_test